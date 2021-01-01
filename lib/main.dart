import 'package:flutter/material.dart';
import 'package:philia/qcard.dart';
import 'homepage.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your applfication.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/qcard': (context) => QCard(),
      },

      title: 'Philia',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
    );
  }
}



