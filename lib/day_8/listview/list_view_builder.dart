import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            // Listview builder digunakan ketika kita tidak tahu jumlah data yang akan ditampilkan dan ingin membuat listview yang efisien
            // Menampilkan data dalam bentuk list dengan jumlah item yang banyak dan dinamis
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                color: index % 2 == 0 ? Colors.pinkAccent : Colors.amber,
                child: ListTile(
                  leading: Image.asset("assets/images/upin.jpeg"),
                  title: Text("Upin $index"),
                  subtitle: Text("Upin & Ipin Series $index"),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, data) {
              return Divider(color: Colors.white);
            },
            itemCount: 100,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(8),
                color: index % 2 == 0 ? Colors.pinkAccent : Colors.amber,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Image.asset("assets/images/upin.jpeg"),
                  title: Text("Upin $index"),
                  subtitle: Text("Upin & Ipin Series $index"),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
