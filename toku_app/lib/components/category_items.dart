import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({this.text, this.color, this.onTap});
  final String? text;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 24),
        height: 85,
        width: double.infinity,
        color: color,
        child: Text(
          '$text',
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
