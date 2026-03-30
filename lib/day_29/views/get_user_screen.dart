import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_29/api/get_user.dart';

class GetUserScreenDay29 extends StatelessWidget {
  const GetUserScreenDay29({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final users = snapshot.data;
          return ListView.builder(
            itemCount: users?.length,
            itemBuilder: (BuildContext context, int index) {
              final items = users?[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(items?.avatar ?? ""),
                ),
                title: Text("${items?.firstName} ${items?.lastName}" ?? ""),
                subtitle: Text(items?.email ?? ""),
              );
            },
          );
        } else {
          return Text("Gagal memuat data");
        }
      },
    );
  }
}
