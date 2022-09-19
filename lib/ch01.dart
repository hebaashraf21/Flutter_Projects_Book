import 'package:flutter/material.dart';

class HelloWorldTravelApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text("Hello World Travel App"),
              backgroundColor: Colors.blue,
            ),
            body: Builder(
                builder: (context) => SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                            child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Hello World Travel',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 7, 47, 93)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'Discover the World',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: 
                              Container(
                                decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 10, spreadRadius: 2)]),
                                child:Image.network(
                                'https://images.freeimages.com/images/large-previews/eaa/the-beach-1464354.jpg',
                                height: 350,
                                
                              ))
                              ,
                            ),
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: MaterialButton(
                                color: Colors.blue,
                                  child: Text('Contact Us',style: TextStyle(color: Colors.white),),
                                  onPressed: () => contactUs(context)),
                            ),
                          ],
                        ))))));
    throw UnimplementedError();
  }
  void contactUs(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Us',style: TextStyle(color: Color.fromARGB(255, 5, 38, 64),fontWeight: FontWeight.bold),),
          content: Text('Mail us at hello@world.com'),
          actions: <Widget>[
            MaterialButton(
              color: Colors.blue,
              child: Text('Close',style: TextStyle(color: Colors.white),),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      },
    );
  }

}