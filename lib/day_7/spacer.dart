import 'package:flutter/material.dart';

class SpacerDay7 extends StatelessWidget {
  const SpacerDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Upin", style: TextStyle(fontSize: 40)),
        Spacer(),
        Text("Ipin", style: TextStyle(fontSize: 40)),
        // Spacer(),
        Text("Apin", style: TextStyle(fontSize: 40)),
      ],
    );
  }
}
