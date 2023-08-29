import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/application.dart';

abstract class ApplicationDetailsState extends Equatable {
  const ApplicationDetailsState();
}

class ApplicationDetailsInitialState extends ApplicationDetailsState {
  const ApplicationDetailsInitialState();

  @override
  List<Object?> get props => [];
}

class ApplicationDetailsErrorAddDataState extends ApplicationDetailsState {
  final String errorMessage;
  const ApplicationDetailsErrorAddDataState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class ApplicationDetailsSuccessAddDataState extends ApplicationDetailsState {
  final Application app;
  const ApplicationDetailsSuccessAddDataState({
    required this.app,
  });

  @override
  List<Object?> get props => [];
}
