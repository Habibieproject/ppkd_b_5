import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_7/expanded.dart';
import 'package:ppkd_b_5/day_7/padding.dart';
import 'package:ppkd_b_5/day_7/sizedbox.dart';
import 'package:ppkd_b_5/day_7/spacer.dart';

class Day7Screen extends StatelessWidget {
  const Day7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Day 7")),
      body:
          // Center(child: Image.asset("assets/images/upin.jpeg")),// Center digunakan untuk menempatkan widget di tengah-tengah parentnya, baik secara vertikal maupun horizontal.
          Column(
            children: [
              SizedboxDay7(), //SizedBox digunakan untuk memberikan jarak antar widget, bisa vertikal maupun horizontal, dan juga bisa digunakan untuk membungkus widget lain sebagai child dengan ukuran tertentu.
              PaddingDay7(), //Padding digunakan untuk memberikan jarak antara widget dengan batas luar atau widget lainnya, bisa menggunakan EdgeInsets untuk mengatur jarak secara spesifik.
              // ContainerDay7(),// Container digunakan untuk membuat sebuah kotak yang dapat memiliki warna, ukuran, margin, padding, dan dekorasi lainnya. Container juga dapat digunakan untuk membungkus widget lain sebagai child.
              // Text("BATCH 5", style: TextStyle(fontSize: 40)),
              SpacerDay7(), // Spacer digunakan untuk memberikan ruang kosong yang fleksibel antara widget dalam Row atau Column, sehingga widget dapat didorong ke posisi tertentu.

              ExpandedDay7(), // Expanded digunakan untuk memberikan ruang yang fleksibel kepada widget dalam Row atau Column, sehingga widget dapat mengisi ruang yang tersedia sesuai dengan proporsi yang ditentukan oleh properti flex.
              ExpandedColumnDay7(),
            ],
          ),
    );
  }
}

class ExpandedColumnDay7 extends StatelessWidget {
  const ExpandedColumnDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            // flex: 2,
            child: Container(
              height: 100,
              // width: 100,
              decoration: BoxDecoration(color: Colors.yellow),
            ),
          ),
          Expanded(
            // flex: 2,
            child: Container(
              height: 100,
              // width: 100,
              decoration: BoxDecoration(color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }
}
