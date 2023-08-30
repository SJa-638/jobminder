
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_events.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_states.dart';

class ApplicationDetailsBloc extends Bloc<ApplicationDetailsEvent,ApplicationDetailsState>{
  ApplicationDetailsBloc() : super(const ApplicationDetailsInitialState()) {
    on<AddStateEvent>(_onAddDataEvent,);
  }

  void _onAddDataEvent(
    AddStateEvent event,
    Emitter<ApplicationDetailsState> emitter,
  ) async {
    emitter(const ApplicationDetailsInitialState());
    // await Future.delayed(const Duration(seconds: 2));
    // ignore: unnecessary_null_comparison
    if (event.app == null) {
      emitter(const ApplicationDetailsErrorAddDataState(
        errorMessage: "something went very wrong :(",
      ));
    } else {
      event.app.appStates.add(event.newState);
      emitter(ApplicationDetailsSuccessAddDataState(app: event.app));
    }
  }
  
}