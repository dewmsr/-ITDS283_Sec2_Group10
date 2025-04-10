import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/homepage.dart';
import 'pages/signup.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      title: 'Login UI',
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUpPage(),
      },
    );
  }
}

