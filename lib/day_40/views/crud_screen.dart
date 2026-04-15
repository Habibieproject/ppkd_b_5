import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_40/models/siswa_models.dart';
import 'package:ppkd_b_5/day_40/service/siswa_service.dart';

class CRUDFirebaseScreenDay40 extends StatefulWidget {
  const CRUDFirebaseScreenDay40({super.key});

  @override
  State<CRUDFirebaseScreenDay40> createState() =>
      _CRUDFirebaseScreenDay40State();
}

class _CRUDFirebaseScreenDay40State extends State<CRUDFirebaseScreenDay40> {
  // 1. Buat controller untuk mengambil input dari user
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();

  // Fungsi untuk menambah data
  void _simpanData() async {
    if (_namaController.text.isNotEmpty && _kelasController.text.isNotEmpty) {
      // Pastikan property SiswaModelFirebase sesuai dengan field di modelmu
      final dataBaru = SiswaModelFirebase(
        nama: _namaController.text,
        kelas: _kelasController.text,
      );

      final result = await SiswaService.addSiswa(dataBaru);

      // Bersihkan form setelah simpan
      _namaController.clear();
      _kelasController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data berhasil ditambahkan!")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Siswa Firebase"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- SECTION INPUT ---
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _namaController,
                      decoration: const InputDecoration(
                        labelText: "Nama Siswa",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _kelasController,
                      decoration: const InputDecoration(
                        labelText: "Kelas",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _simpanData,
                        icon: const Icon(Icons.add),
                        label: const Text("Tambah Siswa"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const Text(
              "Data Siswa Realtime",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            // --- SECTION LIST DATA (REALTIME) ---
            Expanded(
              child: StreamBuilder<List<SiswaModelFirebase>>(
                stream: SiswaService.getAllSiswa(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final listSiswa = snapshot.data ?? [];

                  if (listSiswa.isEmpty) {
                    return const Center(child: Text("Belum ada data siswa."));
                  }

                  return ListView.builder(
                    itemCount: listSiswa.length,
                    itemBuilder: (context, index) {
                      final siswa = listSiswa[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(siswa.nama?[0].toUpperCase() ?? ""),
                          ),
                          title: Text(siswa.nama ?? ""),
                          subtitle: Text("Kelas: ${siswa.kelas}"),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                                onPressed: () {
                                  // Update functionality
                                  _namaController.text = siswa.nama ?? "";
                                  _kelasController.text = siswa.kelas ?? "";

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Update Siswa"),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: _namaController,
                                              decoration: const InputDecoration(
                                                labelText: "Nama Siswa",
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            TextField(
                                              controller: _kelasController,
                                              decoration: const InputDecoration(
                                                labelText: "Kelas",
                                              ),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text("Batal"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (_namaController
                                                      .text
                                                      .isNotEmpty &&
                                                  _kelasController
                                                      .text
                                                      .isNotEmpty) {
                                                final updatedSiswa =
                                                    SiswaModelFirebase(
                                                      id: siswa.id,
                                                      nama:
                                                          _namaController.text,
                                                      kelas:
                                                          _kelasController.text,
                                                    );

                                                await SiswaService.updateSiswa(
                                                  updatedSiswa.id!,
                                                  updatedSiswa,
                                                );

                                                if (mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        "Data berhasil diperbarui!",
                                                      ),
                                                    ),
                                                  );
                                                }
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            child: const Text("Update"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                onPressed: () async {
                                  // Delete functionality
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Hapus Siswa"),
                                        content: const Text(
                                          "Apakah Anda yakin ingin menghapus data ini?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.of(
                                              context,
                                            ).pop(false),
                                            child: const Text("Batal"),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("Hapus"),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  if (confirm == true) {
                                    await SiswaService.deleteSiswa(siswa.id!);

                                    if (mounted) {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Data berhasil dihapus!",
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _kelasController.dispose();
    super.dispose();
  }
}
