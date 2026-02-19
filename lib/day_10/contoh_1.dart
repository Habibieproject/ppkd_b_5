import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_10/elevated_button.dart';
import 'package:ppkd_b_5/day_10/icon_button.dart';

class Example1Day10Screen extends StatefulWidget {
  const Example1Day10Screen({super.key});

  @override
  State<Example1Day10Screen> createState() => _Example1Day10ScreenState();
}

class _Example1Day10ScreenState extends State<Example1Day10Screen> {
  int _counter = 0;
  void decrement() {
    _counter--;
    print("Nilai dari _Counter :$_counter");
    setState(() {});
  }

  void increment({String? textPrint}) {
    _counter++;
    print("Nilai dari _Counter :$_counter");
    print("$textPrint :$_counter");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild data $_counter");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$_counter", style: TextStyle(fontSize: 50)),
        Row(
          children: [
            IconButtonDay10(onPressed: decrement, icon: Icons.minimize),
            IconButtonDay10(onPressed: increment, icon: Icons.add),
          ],
        ),
        //Kalau pakai ElevatedButton
        Row(
          children: [
            ElevatedButtonDay10(onPressed: decrement, text: 'Kurang'),
            ElevatedButtonDay10(onPressed: increment, text: "Tambah"),
          ],
        ),

        //Kalau pakai textbutton
        Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: decrement,
              child: Text("Kurang", style: TextStyle(fontSize: 50)),
            ),
            TextButton(
              onPressed: increment,
              child: Text("Tambah", style: TextStyle(fontSize: 50)),
            ),
          ],
        ),
        InkWell(
          splashColor: Colors.pink,
          onTap: increment,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.network(
              "https://www.asianagri.com/wp-content/uploads/2018/08/Antonius-Tulus_AsianAgri.jpg",
            ),
          ),
        ),

        GestureDetector(
          onTap: decrement,
          onDoubleTap: () {
            increment(textPrint: "On Double Press");
          },
          onLongPress: () {
            increment(textPrint: "On long Press");
          },
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.network(
              "https://www.asianagri.com/wp-content/uploads/2018/08/Antonius-Tulus_AsianAgri.jpg",
            ),
          ),
        ),
      ],
    );
  }
}
