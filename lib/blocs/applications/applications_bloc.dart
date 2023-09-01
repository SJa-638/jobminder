
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications/applications_events.dart';
import 'package:jobminder/blocs/applications/applications_states.dart';



class ApplicationsBloc extends Bloc<ApplicationsEvent,ApplicationsState>{
  ApplicationsBloc() : super(const ApplicationsInitialState()){
    on<AddApplicationEvent>(_onAddApplicationEvent,);

  }

  void _onAddApplicationEvent(AddApplicationEvent event,
    Emitter<ApplicationsState> emitter,
  ) async {
    emitter(const ApplicationsInitialState());
    // ignore: unnecessary_null_comparison
    if (event.newApp == null) {
      emitter(const ApplicationsErrorAddState(
        errorMessage: "something went very wrong :(",
      ));
    } else {
      event.applications.add(event.newApp);
      emitter(ApplicationsSuccessAddState(event.applications));
    }
  }
  
}