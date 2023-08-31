import 'package:equatable/equatable.dart';
abstract class ApplicationsState extends Equatable {
  const ApplicationsState();
}

class ApplicationsInitialState extends ApplicationsState {
  const ApplicationsInitialState();

  @override
  List<Object?> get props => [];
}

