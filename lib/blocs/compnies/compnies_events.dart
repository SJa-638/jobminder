import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/company.dart';

abstract class CompaniesEvent extends Equatable {
  const CompaniesEvent();
}

class AddcompanyEvent extends CompaniesEvent {
  final Company newComp;
  final List<Company> companies;

  const AddcompanyEvent(this.newComp, this.companies);

  @override
  List<Object?> get props => [];
}
