import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/application.dart';

abstract class ApplicationsEvent extends Equatable {
  const ApplicationsEvent();
}

class AddApplicationEvent extends ApplicationsEvent {
  final Application newApp;
  final List<Application> applications;

  const AddApplicationEvent(this.newApp, this.applications);

  @override
  List<Object?> get props => [];
}
