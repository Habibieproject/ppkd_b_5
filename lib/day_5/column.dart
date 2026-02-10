import 'package:flutter/material.dart';

class ColumnDay5 extends StatelessWidget {
  const ColumnDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Nama :Habibie",
          style: TextStyle(fontSize: 50),
        ), //fontsize : Mengatur size font
        Text(
          "Umur : 17 Tahun", //Text : Widget untuk menampilkan teks
          style: TextStyle(
            //TextStyle : Widget untuk mengatur style teks
            color: Colors.blue, //color : Mengatur warna font
            fontSize: 40, //fontSize : Mengatur ukuran font
            fontWeight: FontWeight.bold, //fontWeight : Mengatur ketebalan font
          ),
        ),
        Text(
          "Pekerjaan : Instruktur",
          style: TextStyle(
            //TextStyle : Widget untuk mengatur style teks
            color: Colors.red, //color : Mengatur warna font
            fontSize: 30, //fontSize : Mengatur ukuran font
            fontWeight: FontWeight.w400, //fontWeight : Mengatur ketebalan font
            decoration:
                TextDecoration.underline, //decoration : Mengatur dekorasi teks
            fontStyle: FontStyle
                .italic, //fontStyle : Mengatur gaya font (italic atau normal)
          ),
        ),
        Text("Pekerjaan : Instruktur"),
      ],
    );
  }
}
