import 'package:flutter/material.dart';

class ListMapScreen extends StatelessWidget {
  ListMapScreen({super.key});
  final List<Map<String, dynamic>> dataUser = [
    {
      "nama": "Pria Solo",
      "alamat": "Tembok Ratapan Solo",
      "hobi": "Masuk gorong",
      "foto":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Steve_Austin_by_Gage_Skidmore.jpg/500px-Steve_Austin_by_Gage_Skidmore.jpg",
    },
    {
      "nama": "Fufufafa",
      "alamat": "IKN",
      "hobi": "Ngantuk",
      "foto":
          "https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1000w,f_avif,q_auto:eco,dpr_2/rockcms/2023-03/rey-mysterio-zz-230327-02-58c597.jpg",
    },
    {
      "nama": "Pria Sawit",
      "alamat": "USA",
      "hobi": "MBG",
      "foto":
          "https://static.toiimg.com/thumb/msid-111889540,imgsize-367990,width-400,resizemode-4/111889540.jpg",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataUser.length,
      itemBuilder: (BuildContext context, int index) {
        final data = dataUser[index];
        return ListTile(
          title: Text(data["nama"]),
          subtitle: Text(data["alamat"]),
          leading: Image.network(data["foto"]),
        );
      },
    );
  }
}
