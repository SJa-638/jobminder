
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications/applications_events.dart';
import 'package:jobminder/blocs/applications/applications_states.dart';



class ApplicationsBloc extends Bloc<ApplicationsEvent,ApplicationsState>{
  ApplicationsBloc() : super(const ApplicationsInitialState());
  
}