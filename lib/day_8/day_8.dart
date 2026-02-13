import 'package:flutter/material.dart';

class Day8Screen extends StatelessWidget {
  const Day8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Stack digunakan untuk menumpuk widget di atas widget lainnya
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.lightGreen,
                ),
              ),
            ],
          ),
          // ListViewBuilder(),
          // GridViewAja(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              TextField(),
            ],
          ),
        ],
      ),
      // buildSingleChildScrollView(),
    );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildStack(),
          buildStack(),
          buildStack(),
          buildStack(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [buildStack(), buildStack(), buildStack()]),
          ),
        ],
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: AlignmentGeometry.center,
      clipBehavior: Clip.none,
      children: [
        Container(height: 400, width: 200, color: Colors.blue),
        Container(height: 300, width: 200, color: Colors.yellow),
        Container(height: 200, width: 200, color: const Color(0xFFB81A1A)),
        Positioned(
          right: -50,
          child: Container(height: 100, width: 100, color: Colors.black),
        ),
      ],
    );
  }
}
