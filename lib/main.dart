import 'package:flutter/material.dart';
import 'package:wootter_news/Screens/News_Screen.dart';
import 'package:wootter_news/Screens/Signup_Screen.dart';
import 'package:wootter_news/color.dart';
import 'dart:async';

import 'Screens/News_Feed.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          brightness: Brightness.dark),
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/logos.png'),
                    width: 200,
                    height: 200,
                  ),

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                  ),
                 Text('Wootter Cyber News',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      )
                      ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
