import 'package:flutter/material.dart';
import 'package:jobminder/screens/home_screen.dart';
import 'package:jobminder/screens/company_screen.dart';
import 'package:jobminder/screens/questions_screen.dart';
import 'package:jobminder/screens/login_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
       // '/interviews': (context) => companyScreen(),
       // '/questions': (context) => QuestionsScreen(),
       // '/logout': (context) => LoginScreen(),
      },
    );
  }
}
    