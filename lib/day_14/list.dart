import 'package:flutter/material.dart';

class ListViewBuilderDay14List extends StatelessWidget {
  ListViewBuilderDay14List({super.key});
  final List<String> dataProduk = [
    "Apple",
    "Samsung",
    "Acer",
    "Polytron",
    "Xiaomi",
    "RealMe",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataProduk.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 40,
          color: Colors.amber,
          child: Text("$index : ${dataProduk[index]}"),
        );
      },
    );
  }
}
