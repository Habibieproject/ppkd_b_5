import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_10/contoh_1.dart';

class Day10Screen extends StatefulWidget {
  const Day10Screen({super.key});

  @override
  State<Day10Screen> createState() => _Day10ScreenState();
}

class _Day10ScreenState extends State<Day10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Day 10")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.qr_code),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Example1Day10Screen(),
          // Example2Day10Screen(),
          // ElevatedButtonDay10(),
        ],
      ),
    );
  }
}
