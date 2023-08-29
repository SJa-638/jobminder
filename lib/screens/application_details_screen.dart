import 'package:flutter/material.dart';
import 'package:jobminder/modules/application.dart';

class ApplicationDetailsScreen extends StatelessWidget {
  final Application application;


  const ApplicationDetailsScreen({super.key, required this.application});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(application.postion),
      ),
    );
  }

}
