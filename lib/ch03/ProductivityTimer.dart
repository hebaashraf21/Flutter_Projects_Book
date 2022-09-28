import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects_book/ch03/ProductivityButton.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProductivityTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Work timer"),
        ),
        body: Center(
          child:
              LayoutBuilder(builder: (BuildContext context, BoxConstraints b) {
            double width = b.maxWidth;
            return Column(
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
                Expanded(
                    child: CircularPercentIndicator(
                  radius: width / 3,
                  lineWidth: 10.0,
                  percent: 1,
                  center: Text("30:00",
                      style: Theme.of(context).textTheme.bodyMedium),
                  progressColor: Color(0xff009688),
                )),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            backgroundColor: Color(0xff212121),
                            text: 'Stop',
                            onPressed: () {})),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                    Expanded(
                        child: ProductivityButton(
                            backgroundColor: Color(0xff009688),
                            text: 'Restart',
                            onPressed: () {})),
                    Padding(
                      padding: EdgeInsets.all(10),
                    ),
                  ],
                )
              ],
            );
          }),
        ));
    throw UnimplementedError();
  }
}
