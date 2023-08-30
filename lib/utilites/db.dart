// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  // ignore: avoid_init_to_null
  late User? _user = null;
  FirebaseService();

  bool isSignedIn() {
    return _user != null;
  }

  // ignore: non_constant_identifier_names
  void addCompany(CompanyName) {
    if (!isSignedIn()) {
      print("no user");
      return;
    }
    final ref = _database.ref().child('${_user?.uid}/Companies/');
    ref.push().set(CompanyName);
  }

  void _addUserName(uname) {
    if (!isSignedIn()) {
      print("no user");
      return;
    }
    final ref = _database.ref().child('${_user?.uid}/UserName/');
    ref.set(uname);
  }

  void signUpWithEmailAndPassword(
      String email, String password, String userName) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = credential.user;
      _addUserName(userName);
    } catch (e) {
      print("Some error occured");
    }
  }

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _user = credential.user;
    } catch (e) {
      print("Some error occured");
    }
  }
}
