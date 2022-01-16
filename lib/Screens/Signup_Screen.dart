import 'package:flutter/material.dart';
import 'package:wootter_news/Screens/News_Screen.dart';
import 'package:wootter_news/color.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'News_Feed.dart';

class SignUp extends StatelessWidget {
  // SignUp({Key key}) : super(key: key);

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                onPressed: () {},
                tooltip: 'Go Back',
              );
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
              color: kPrimaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'Welcome to Wootter Cyber News',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                   Text(
                    'Community',
                   textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '''                 For moderation reasons, using the
                      community features requires
              linking your account to a social network.''',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sign up and start a discussion!',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                    // text: 'Sign up with Facebook',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SignInButton(
                    Buttons.Twitter,
                    onPressed: () {},
                    // text: "Sign up with twitter",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                    // text: 'Sign up with Google',
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RSSDemo(),
                                  ));
                            },
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
