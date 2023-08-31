import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/company.dart';

abstract class CompaniesState extends Equatable {
  const CompaniesState();
}

class CompaniesInitialState extends CompaniesState {
  const CompaniesInitialState();

  @override
  List<Object?> get props => [];
}

class CompaniesErrorAddState extends CompaniesState {
  final String errorMessage;
  const CompaniesErrorAddState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class CompaniesSuccessAddState extends CompaniesState {
  final List<Company> companies;
  const CompaniesSuccessAddState(this.companies);

  @override
  List<Company> get props => companies;
}
