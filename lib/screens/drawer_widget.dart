import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
import 'package:jobminder/blocs/questions/questions_bloc.dart';
import 'package:jobminder/screens/company_screen.dart';
import 'package:jobminder/screens/home_screen.dart';
import 'package:jobminder/screens/login_screen.dart';
import 'package:jobminder/screens/questions_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
backgroundColor:  const Color.fromARGB(255, 210, 173, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
            
           ListTile(
            leading: const Icon(Icons.home,color: Color.fromARGB(255, 202, 28, 255),size: 35,),
            title: const Text('Home',style: TextStyle(fontSize: 24),),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.assignment,color: Color.fromARGB(255, 202, 28, 255),size: 35,),
            title: const Text('Interviews',style: TextStyle(fontSize: 24),),
            onTap: () {
            
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                       BlocProvider(
                        create: (context) => CompaniesBloc(),
                        child: const CompaniesScreen(),
                      ),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer,color: Color.fromARGB(255, 202, 28, 255),size: 35,),
            title: const Text('Questions',style: TextStyle(fontSize: 24),),
            onTap: () {
              
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => 
                       BlocProvider(
                        create: (context) => QuestionsBloc(),
                        child: const QuestionsScreen(),
                      ),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app,color: Color.fromARGB(255, 202, 28, 255),size: 35,),
            title: const Text('Logout',style: TextStyle(fontSize: 24),),
            onTap: () {
              
              Navigator.push(
                   context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
                  
                );
            },
          ),
          
        ],
      ),
    
    );
  }
}
