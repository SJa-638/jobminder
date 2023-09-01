import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/application.dart';
abstract class ApplicationsState extends Equatable {
  const ApplicationsState();
}

class ApplicationsInitialState extends ApplicationsState {
  const ApplicationsInitialState();

  @override
  List<Object?> get props => [];
}


class ApplicationsErrorAddState extends ApplicationsState {
  final String errorMessage;
  const ApplicationsErrorAddState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class ApplicationsSuccessAddState extends ApplicationsState {
  final List<Application> applications;
  const ApplicationsSuccessAddState(this.applications);

  @override
  List<Application> get props => applications;
}
