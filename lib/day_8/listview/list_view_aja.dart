import 'package:flutter/material.dart';

class ListViewAja extends StatelessWidget {
  const ListViewAja({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // Listview ini berfungsi untuk menampilkan data dalam bentuk list
      physics: BouncingScrollPhysics(),
      children: [
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
        Text("data", style: TextStyle(fontSize: 50)),
      ],
    );
  }
}
