import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_10/elevated_button.dart';
import 'package:ppkd_b_5/day_11/second_screen.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class FirstScreenDay11 extends StatelessWidget {
  const FirstScreenDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Screen")),
      body: Column(
        children: [
          ElevatedButtonDay10(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SecondScreenDay11()),
              // );
              // context.push(SecondScreenDay11());
              context.pushReplacement(SecondScreenDay11());
            },
            text: "Pindah ke halaman 2",
          ),
        ],
      ),
    );
  }
}
