
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_events.dart';
import 'package:jobminder/blocs/compnies/compnies_states.dart';


class CompaniesBloc extends Bloc<CompaniesEvent,CompaniesState>{
  CompaniesBloc() : super(const CompaniesInitialState()) {
    on<AddcompanyEvent>(_onAddcompanyEvent,);
  }

  void _onAddcompanyEvent(
    AddcompanyEvent event,
    Emitter<CompaniesState> emitter,
  ) async {
    emitter(const CompaniesInitialState());
    // await Future.delayed(const Duration(seconds: 2));
    // ignore: unnecessary_null_comparison
    if (event.newComp == null) {
      emitter(const CompaniesErrorAddState(
        errorMessage: "something went very wrong :(",
      ));
    } else {
      event.companies.add(event.newComp);
      DatabaseReference ref = FirebaseDatabase.instance.ref("users/123/companies");
      await ref.push().set(event.newComp.name);

      emitter(CompaniesSuccessAddState(event.companies));
    }
  }
  
}