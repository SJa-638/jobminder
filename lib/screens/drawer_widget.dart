import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
import 'package:jobminder/modules/company.dart';
import 'package:jobminder/screens/company_screen.dart';
import 'package:jobminder/screens/home_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF06B4F4),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo(no background).png', // Replace with your logo image path
                    height: 80.0,
                    width: 80.0,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text('Interviews'),
            onTap: () {
              List<Company> comps = [];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                      BlocProvider(
                        create: (context) => CompaniesBloc(),
                        child: CompaniesScreen(companies: comps),
                      ),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('Questions'),
            onTap: () {
              // Handle Questions onTap functionality
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              // Handle Logout onTap functionality
            },
          ),
        ],
      ),
    );
  }
}
