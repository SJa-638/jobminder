import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFF9AE2FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF06B4F4),
        title:const Text('Dashboard',
        style:TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22,
                ),
      ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
               children: [
                 const Text(
               'Menu',
               style: TextStyle(
               color: Colors.white,
               fontSize: 20.0,
                ),
                ),
              const SizedBox(height: 10.0),
              Image.asset(
              'assets/images/logo.jpeg',  // Replace with your logo image path
                height: 80.0,
                width: 80.0,
                
                 ),
               // Add some spacing between the image and text
             
                
                 ],
                 ),
              decoration: const BoxDecoration(
                color: const Color(0xFF06B4F4),
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
      ),
      body:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Icon(
                    Icons.person_2_rounded,
                    color:Colors.grey,
                    size: 80,
                  ),
                ),
              ),
             const  Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Text(
                  'user Name',
                  style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 20,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.linear,
                    width: 394,
                    height: 440,
                    decoration:const  BoxDecoration(
                      color:Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      shape: BoxShape.rectangle,
                    ),
                    alignment: const AlignmentDirectional(10, 10),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment:const  AlignmentDirectional(0, 0),
                                  child:Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(
                                        90, 50, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFFADEF),
                                        boxShadow:const [
                                           BoxShadow(
                                            blurRadius: 4,
                                            color:  Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                '0',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Processing',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(
                                        10, 50, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFFAF6B5),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child:const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                '0',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Accepted',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment:const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(
                                        90, 10, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFCFA8FF),
                                        boxShadow:const [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                '0',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Rejected',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:const EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 0, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF9AE2FF),
                                        boxShadow:const [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x33000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(12),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: const Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                '0',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Applications',
                                                style:TextStyle(
                                                          fontFamily:
                                                              'Readex Pro',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        
                                              ),
                                            ),
                                          ),
                                          ),
                                        ],//children
                                      ),
                                    ),
                                  ),
                                ),
                              ],//children
                            ),
                          ],
                        ),
                      ],
                    ),
          )
                ),
              ),
            ],
          ),
        );  
        
  }
}