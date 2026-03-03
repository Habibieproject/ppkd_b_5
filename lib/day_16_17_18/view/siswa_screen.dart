import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_16_17_18/database/siswa_controller.dart';
import 'package:ppkd_b_5/day_16_17_18/models/siswa_model.dart';
import 'package:ppkd_b_5/day_16_17_18/utils/decoration_form.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class SiswaScreen extends StatefulWidget {
  const SiswaScreen({super.key});

  @override
  State<SiswaScreen> createState() => _SiswaScreenState();
}

class _SiswaScreenState extends State<SiswaScreen> {
  late List<SiswaModel> dataSiswa = [];
  @override
  void initState() {
    super.initState();
    getDataSiswa();
  }

  Future<void> getDataSiswa() async {
    await Future.delayed(Duration(seconds: 3));
    dataSiswa = await SiswaController.getAllSiswa();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataSiswa.isEmpty || dataSiswa == []
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              shrinkWrap: true,
              itemCount: dataSiswa.length,
              itemBuilder: (BuildContext context, int index) {
                final items = dataSiswa[index];
                return ListTile(
                  title: Text(items.nama),
                  subtitle: Text(items.kelas),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await showEditDialog(context, items);
                          dataSiswa = await SiswaController.getAllSiswa();
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          await showDeleteDialog(context, items.id!);
                          dataSiswa = await SiswaController.getAllSiswa();
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Future<void> showEditDialog(BuildContext context, SiswaModel items) async {
    final namaController = TextEditingController(text: items.nama);
    final kelasController = TextEditingController(text: items.kelas);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Siswa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: namaController,
                decoration: decorationConstant(hintText: "Nama"),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: kelasController,
                decoration: decorationConstant(hintText: "Kelas"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                if (items.id == null) {
                  return;
                }
                await SiswaController.updateSiswa(
                  SiswaModel(
                    id: items.id,
                    nama: namaController.text,
                    kelas: kelasController.text,
                  ),
                );
                context.pop();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Siswa di update")));
              },
              child: Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  Future<void> showDeleteDialog(BuildContext context, int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Konfirmasi"),
          content: Text("Apakah anda yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                context.pop(false);
              },
              child: Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () async {
                context.pop(true);
              },
              child: Text("Hapus bae"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      await SiswaController.deleteSiswa(id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data berhasil dihapus")));
      setState(() {});
    }
  }
}
