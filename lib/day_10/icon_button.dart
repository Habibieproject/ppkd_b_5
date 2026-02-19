import 'package:flutter/material.dart';

class IconButtonDay10 extends StatelessWidget {
  const IconButtonDay10({super.key, this.onPressed, required this.icon});
  final void Function()? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon));
  }
}
