import 'package:flutter/material.dart';
import 'package:ppkd_b_5/day_14/data/data_got.dart';

class ModelListViewBuilderDay14 extends StatelessWidget {
  const ModelListViewBuilderDay14({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataGot.length,
      itemBuilder: (BuildContext context, int index) {
        final data = dataGot[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data.imageUrl ?? ''),
          ),
          // child: Image.network(data.imageUrl ?? '')),
          title: Text(data.fullName ?? data.firstName ?? ''),
          subtitle: Text(data.title ?? ''),
        );
      },
    );
  }
}
