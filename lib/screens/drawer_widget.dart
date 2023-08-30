import 'package:flutter/material.dart';
import 'package:jobminder/screens/home_screen.dart';
class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
              child: Row(
               children: [
                Image.asset(
              'assets/images/logo(no background).png',  // Replace with your logo image path
                height: 80.0,
                width: 80.0,
                  ),
              const SizedBox(width: 20.0,),
            //  const Text(
            //    'Menu',
            //    style: TextStyle(
            //    color: Colors.white,
            //    fontSize: 20.0,
            //     ),
            //     ),
                              
                 ],
              ),
                 ),
              decoration: const BoxDecoration(
                color: Color(0xFF06B4F4),
              ),
            ),
            ListTile(
              leading:const Icon(Icons.home),
              title:const Text('Home'),
              onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          ),
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title:const Text('Interviews'),
              onTap: () {
                // Handle Interviews onTap functionality
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
              leading:const Icon(Icons.exit_to_app),
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