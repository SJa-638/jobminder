import 'package:jobminder/modules/application_state.dart';
import 'company.dart';

class Application{

  final String postion;
  final String id;
  late List<ApplicationState> appStates = [];
  final WorkModle workModle;
  final JobType jobType;
  final Company company;
  // ignore: avoid_init_to_null
  late String? notes = null;

  Application(this.postion, this.workModle, this.jobType, this.company, this.id);

  factory Application.fromJson(Map<String, Object> json) {
    return Application(
      json['postion'] as String,
      WorkModle.values[json['workModle'] as int],
      JobType.values[json['jobType'] as int],
      Company.fromJson(Map<String, Object>.from(json['company'] as Map<String, Object>)),
      json['ID'] as String,

    );
  }


  
}

enum WorkModle{
  remote, office, hybrid
}

enum JobType{
  fulltime, parttime, freelance, internship, contract
}