import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.title, required this.size});

  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
