import 'package:flutter/material.dart';

class ExpandedDay7 extends StatelessWidget {
  const ExpandedDay7({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Image.asset("assets/images/upin.jpeg")),

            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text("FOLLOW"),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.orange),
                child: Text("MESSAGE"),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.green),
              ),
            ),
            Expanded(
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
