import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_16_17/database/siswa_controller.dart';
import 'package:ppkd_b_5/day_16_17/models/siswa_model.dart';
import 'package:ppkd_b_5/day_16_17/utils/decoration_form.dart';
import 'package:ppkd_b_5/day_16_17/view/siswa_screen.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class CrSiswaScreenDay17 extends StatefulWidget {
  const CrSiswaScreenDay17({super.key});

  @override
  State<CrSiswaScreenDay17> createState() => _CrSiswaScreenDay17State();
}

class _CrSiswaScreenDay17State extends State<CrSiswaScreenDay17> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController kelasController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: decorationConstant(
                  hintText: "Masukkan Nama Siswa",
                  // color: Colors.red,
                ),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: kelasController,
                decoration: decorationConstant(
                  hintText: "Masukkan Kelas Siswa",
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nama belum di isi")),
                      );
                      return;
                    }
                    if (kelasController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Kelas belum di isi")),
                      );
                      return;
                    }
                    SiswaController.registerSiswa(
                      SiswaModel(
                        nama: nameController.text,
                        kelas: kelasController.text,
                      ),
                    );
                    nameController.clear();
                    kelasController.clear();
                    setState(() {});
                  },
                  child: Text("Tambah Siswa"),
                ),
              ),
              SizedBox(height: 24),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.push(SiswaScreen());
                  },
                  child: Text("Lihat Data Siswa"),
                ),
              ),
              SizedBox(height: 24),
              Row(children: [Text("Data Siswa")]),
              SizedBox(height: 12),

              siswaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

FutureBuilder<List<SiswaModel>> siswaWidget() {
  return FutureBuilder<List<SiswaModel>>(
    future: SiswaController.getAllSiswa(),

    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }
      final dataSiswa = snapshot.data as List<SiswaModel>;
      return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dataSiswa.length,
        itemBuilder: (BuildContext context, int index) {
          final items = dataSiswa[index];
          return ListTile(title: Text(items.nama), subtitle: Text(items.kelas));
        },
      );
    },
  );
}
