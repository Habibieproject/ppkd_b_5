import 'package:flutter/material.dart';

class GridViewAja extends StatelessWidget {
  const GridViewAja({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Gridview count digunakan ketika kita tahu jumlah kolom atau barisnya
      // Gridview builder digunakan ketika kita tidak tahu jumlah kolom atau barisnya
      // Gridview extent digunakan ketika kita ingin menentukan ukuran maksimal dari itemnya
      // Gridview custom digunakan ketika kita ingin mengkustomisasi gridviewnya
      // Gridview ini berfungsi untuk menampilkan data dalam bentuk grid
      crossAxisCount: 3,
      crossAxisSpacing: 4,
      mainAxisSpacing: 4,
      // childAspectRatio: 2 / 3,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.red,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.orange,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.pink,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
