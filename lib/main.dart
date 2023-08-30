import 'package:flutter/material.dart';

import 'package:jobminder/screens/home_screen.dart';
// import 'package:jobminder/screens/company_screen.dart';
// import 'package:jobminder/screens/questions_screen.dart';
// import 'package:jobminder/screens/login_screen.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
// import 'package:jobminder/modules/application.dart';
// import 'package:jobminder/modules/company.dart';
// import 'package:jobminder/screens/application_details_screen.dart';
// import 'package:jobminder/screens/company_screen.dart';
// import 'blocs/applications_detailes/applications_detailes_bloc.dart';

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
      title: 'Home Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
      '/': (context) => const HomeScreen(),
    },
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   HomeScreen({super.key});
  
//   final List<Company> companies = [
//     Company(name: 'Company 1'),
//     Company(name: 'Company 2'),
//     Company(name: 'Company 3'),];

//   final Application app = Application('test', WorkModle.remote, JobType.fulltime, Company(name: 'Company demo'));
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               child: const Text("Show app details"),
//               onPressed: () => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => 
//                       BlocProvider(
//                         create: (context) => ApplicationDetailsBloc(),
//                         child: ApplicationDetailsScreen(application: app),
//                       ),
//                   ),
//                 )
//               },
//             ),
//             ElevatedButton(
//               child: const Text("Show Companies"),
//               onPressed: () => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => 
//                       BlocProvider(
//                         create: (context) => CompaniesBloc(),
//                         child: CompaniesScreen(companies: companies),
//                       ),
//                   ),
//                 )
//               },
//             ),
//           ],
//         ),
//       )
//     );
//   }


// }
