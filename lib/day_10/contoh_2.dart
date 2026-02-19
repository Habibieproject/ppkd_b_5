import 'package:flutter/material.dart';

class Example2Day10Screen extends StatefulWidget {
  const Example2Day10Screen({super.key});

  @override
  State<Example2Day10Screen> createState() => _Example2Day10ScreenState();
}

class _Example2Day10ScreenState extends State<Example2Day10Screen> {
  bool showImage = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          showImage ? "Tampilkan Gambar" : "Sembunyikan Gambar",
          style: TextStyle(fontSize: 50),
        ),
        TextButton(
          onPressed: () {
            setState(() {});
            showImage = !showImage;
            print("Nilai dari $showImage");
          },
          child: Text("TOMBOL HIDDEN/SHOW"),
        ),
        if (showImage)
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              "https://www.asianagri.com/wp-content/uploads/2018/08/Antonius-Tulus_AsianAgri.jpg",

              // height: 20,
            ),
          ),
      ],
    );
  }
}
