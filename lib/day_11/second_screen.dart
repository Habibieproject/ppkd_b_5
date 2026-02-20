import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_10/elevated_button.dart';
import 'package:ppkd_b_5/extension/navigator.dart';

class SecondScreenDay11 extends StatelessWidget {
  const SecondScreenDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),

      body: Column(
        children: [
          Text("Ini adalah halaman kedua"),
          ElevatedButtonDay10(
            text: "Kembali ke halaman pertama",
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.of(context).pop();
              // Navigator.maybePop(context);
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
