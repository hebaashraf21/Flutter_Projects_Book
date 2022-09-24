import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_book/ch03/ProductivityButton.dart';

class ProductivityTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Work timer"),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          backgroundColor: Color(0xff009688),
                          text: "Work",
                          onPressed: () {})),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          backgroundColor: Color(0xff607D8B),
                          text: "Short Break",
                          onPressed: () {})),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Expanded(
                      child: ProductivityButton(
                          backgroundColor: Color(0xff455A64),
                          text: "Long Break",
                          onPressed: () {})),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                ],
              ),
            ],
          ),
        ));
    throw UnimplementedError();
  }
}
