import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_29/api/get_user.dart';
import 'package:ppkd_b_5/day_29/models/user_models.dart';

class GetUserStatefulScreenDay29 extends StatefulWidget {
  const GetUserStatefulScreenDay29({super.key});

  @override
  State<GetUserStatefulScreenDay29> createState() =>
      _GetUserStatefulScreenDay29State();
}

class _GetUserStatefulScreenDay29State
    extends State<GetUserStatefulScreenDay29> {
  late List<GetUserData> dataUser = [];
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    dataUser = await getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return dataUser.isEmpty || dataUser == []
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: dataUser.length,
            itemBuilder: (BuildContext context, int index) {
              final items = dataUser[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(items.avatar ?? ""),
                ),
                title: Text("${items.firstName} ${items.lastName}" ?? ""),
                subtitle: Text(items.email ?? ""),
              );
            },
          );
  }
}
