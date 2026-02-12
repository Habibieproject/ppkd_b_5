import 'package:flutter/material.dart';

class PaddingDay7 extends StatelessWidget {
  const PaddingDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: const EdgeInsets.symmetric(vertical: 20),
      // padding: const EdgeInsets.symmetric(horizontal: 20),
      // padding: const EdgeInsets.only(left: 40, top: 30),
      // padding: const EdgeInsets.fromLTRB(12, 12, 4, 4),
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Row(
          children: [
            Column(
              children: [
                Text("Saya Anak PPKD Batch 1 2026"),
                Text("Saya Anak PPKD Batch 1 2026"),
                Text("Saya Anak PPKD Batch 1 2026"),
                Text("Saya Anak PPKD Batch 1 2026"),
                Text("Saya Anak PPKD Batch 1 2026"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
