import 'package:flutter/material.dart';
import 'package:flutter_projects_book/ch01/HelloWorld.dart';
import 'package:flutter_projects_book/ch02/MeasuresConverter.dart';

void main() => runApp(new TravelApp());

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello World",
        home: Converter());
  }

  
}