
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_events.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_states.dart';
import 'package:jobminder/modules/application.dart';

class ApplicationDetailsBloc extends Bloc<ApplicationDetailsEvent,ApplicationDetailsState>{
  final Application app;
  ApplicationDetailsBloc(this.app) : super(ApplicationDetailsInitialState(app)) {
    on<AddStateEvent>(_onAddDataEvent,);
  }

  void _onAddDataEvent(
    AddStateEvent event,
    Emitter<ApplicationDetailsState> emitter,
  ) async {
    emitter( ApplicationDetailsInitialState(event.app));
    // await Future.delayed(const Duration(seconds: 2));
    // ignore: unnecessary_null_comparison
    if (event.app == null) {
      emitter( ApplicationDetailsErrorAddDataState(event.app,
        errorMessage: "something went very wrong :(",
      ));
    } else {
      event.app.appStates.add(event.newState);
      emitter(ApplicationDetailsSuccessAddDataState(event.app));
    }
  }
  
}