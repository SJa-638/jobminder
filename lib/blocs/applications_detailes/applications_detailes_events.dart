import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/application.dart';
import 'package:jobminder/modules/application_state.dart';

abstract class ApplicationDetailsEvent extends Equatable {
  const ApplicationDetailsEvent();
}

class AddStateEvent extends ApplicationDetailsEvent {
  final Application app;
  final ApplicationState newState;

  const AddStateEvent(this.app, this.newState);

  @override
  List<Object?> get props => [];
}
