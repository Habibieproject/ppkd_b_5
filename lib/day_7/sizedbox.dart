import 'package:flutter/material.dart';

class SizedboxDay7 extends StatelessWidget {
  const SizedboxDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Versi Column (Vertikal)
        Text("PPKD BATCH 1 2026"),
        SizedBox(height: 24),
        Text("ASIIIK"),
        SizedBox(height: 24),

        //Versi Row (Horizontal)
        Row(
          children: [
            Text("PPKD BATCH 1 2026"),
            SizedBox(width: 24),
            Text("ASIIIK BANGET"),
          ],
        ),

        //Versi Child
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Text("PPKD BATCH 1 2026"),
              SizedBox(width: 24),
              Text("ASIIIK BANGET"),
            ],
          ),
        ),
      ],
    );
  }
}
