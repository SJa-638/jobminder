import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/modules/application.dart';
import 'package:jobminder/modules/company.dart';
import 'package:jobminder/screens/application_details_screen.dart';
import 'package:jobminder/screens/company_screen.dart';

import 'blocs/applications_detailes/applications_detailes_bloc.dart';


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
  
  final List<Company> companies = [
    Company(name: 'Company 1'),
    Company(name: 'Company 2'),
    Company(name: 'Company 3'),
    Company(name: 'Company 4'),
    Company(name: 'Company 5'),
    Company(name: 'Company 6'),
    Company(name: 'Company 7'),
    Company(name: 'Company 8'),
    Company(name: 'Company 9'),
    Company(name: 'Company 10'),
    Company(name: 'Company 11'),
    Company(name: 'Company 12'),
    Company(name: 'Company 13'),
    Company(name: 'Company 14'),
    Company(name: 'Company 15'),
    Company(name: 'Company 16'),
    Company(name: 'Company 17'),
    Company(name: 'Company 18'),
    Company(name: 'Company 19')];

  final Application app = Application('test', WorkModle.remote, JobType.fulltime, Company(name: 'Company demo'));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Show app details"),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                      BlocProvider(
                        create: (context) => ApplicationDetailsBloc(),
                        child: ApplicationDetailsScreen(application: app),
                      ),
                  ),
                )
              },
            ),
            ElevatedButton(
              child: const Text("Show Companies"),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                      BlocProvider(
                        create: (context) => ApplicationDetailsBloc(),
                        child: CompaniesScreen(companies: companies),
                      ),
                  ),
                )
              },
            ),
          ],
        ),
      )
    );
  }


}