import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/application.dart';

abstract class ApplicationDetailsState extends Equatable {
  final Application app;
  const ApplicationDetailsState(this.app);
   Application get getApp => app;

}

class ApplicationDetailsInitialState extends ApplicationDetailsState {
  const ApplicationDetailsInitialState(super.app);

  @override
  List<Object?> get props => [];
}

class ApplicationDetailsErrorAddDataState extends ApplicationDetailsState {
  final String errorMessage;
  const ApplicationDetailsErrorAddDataState(super.app, {
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class ApplicationDetailsSuccessAddDataState extends ApplicationDetailsState {
  
  const ApplicationDetailsSuccessAddDataState(super.app);

  @override
  List<Object?> get props => [];

}
