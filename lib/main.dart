import 'package:flutter/material.dart';
import 'package:jobminder/modules/application.dart';
import 'package:jobminder/modules/company.dart';
import 'package:jobminder/screens/application_details_screen.dart';


void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
      '/': (context) => HomeScreen(),
    },
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  
  final Application app = Application('test', WorkModle.remote, JobType.fulltime, Company(name: 'test'));
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Fetch Data"),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ApplicationDetailsScreen(application: app),
                ),
            )
          },
        ),
      )
    );
  }


}