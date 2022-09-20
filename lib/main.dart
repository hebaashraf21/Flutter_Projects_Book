import 'package:flutter/material.dart';
import 'package:flutter_projects_book/ch01/ch01.dart';

void main() => runApp(new TravelApp());

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Hello World",
        home: HelloWorldTravelApp());
  }

  
}