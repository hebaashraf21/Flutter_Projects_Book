import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductivityButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
   double? size;
  final VoidCallback onPressed;

  ProductivityButton(
      {required this.text,
      required this.backgroundColor,
       this.size,
      required this.onPressed}) {}
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(this.text, style: TextStyle(color: Colors.white)),
      color: this.backgroundColor,
      minWidth: this.size,
    );
  }
}
