// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_events.dart';
import 'package:jobminder/blocs/questions/questions_bloc.dart';
import 'package:jobminder/blocs/questions/questions_events.dart';
import 'package:jobminder/modules/company.dart';
import 'package:jobminder/modules/question.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;
  // ignore: avoid_init_to_null
  late User? _user = null;

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

  void listenToCompanies(CompaniesBloc bloc) {
    _database.ref().child('${_user?.uid}/Companies/').get().then((snapshot) {
      if (snapshot.value == null) {
        return;
      }
      List<Company> companies = [];
      final comps = Map<String, Object>.from(snapshot.value as dynamic);
      comps.forEach((key, value) {
        Company c = Company(name: value as String);
        bloc.add(AddcompanyEvent(c, companies));
      });
    });
  }

  void addQuestion(Question q) {
    if (!isSignedIn()) {
      print("no user");
      return;
    }
    final ref = _database.ref().child('${_user?.uid}/Questions/');
    ref.push().set({"Question": q.question, "Answer": q.answer});
  }

  void listenToQuestions(QuestionsBloc bloc) {
    _database.ref().child('${_user?.uid}/Questions/').get().then((snapshot) {
      if (snapshot.value == null) {
        return;
      }
      List<Question> questions = [];
      final qs = Map<String, Object>.from(snapshot.value as dynamic);
      qs.forEach((key, value) {
        Question q =
            Question.fromJson(Map<String, Object>.from(value as dynamic));
        bloc.add(AddQuestionEvent(q, questions));
      });
    });
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

  void signOut() {
    _firebaseAuth.signOut();
    _user = null;
  }
}
