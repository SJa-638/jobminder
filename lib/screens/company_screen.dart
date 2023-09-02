import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications/applications_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_states.dart';
import 'package:jobminder/main.dart';
import 'package:jobminder/screens/applications_screen.dart';
import 'package:jobminder/screens/drawer_widget.dart';
import 'package:jobminder/utilites/db.dart';

import '../modules/company.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({
    super.key,
  });

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  late CompaniesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CompaniesBloc>();
    locator.get<FirebaseService>().listenToCompanies(bloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 210, 173, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Companies",
        style: TextStyle(
          color:  Colors.white,
          ),
          ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color:Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return CompaniesForm(
                    bloc: bloc,
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocBuilder<CompaniesBloc, CompaniesState>(
              builder: (context, state) {
            if (state is CompaniesInitialState ||
                state is CompaniesSuccessAddState) {
              locator.get<FirebaseService>().listenToCompanies(bloc);

              return ListView.builder(
                  itemCount: state.props.length,
                  itemBuilder: (context, index) {
                    Company c = state.props[index] as Company;
                    return GestureDetector(
                      onTap: () {
                        // print(widget.companies[index].name);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              BlocProvider(
                                create: (context) => ApplicationsBloc(),
                                child: ApplicationsScreen(company: c),
                              ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(c.name,style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,),),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (state is CompaniesErrorAddState) {
              return Text(state.errorMessage);
            } else {
              return const Text("Something went very wrong :(");
            }
          })),
    );
  }
}

class CompaniesForm extends StatefulWidget {
  final CompaniesBloc bloc;

  const CompaniesForm({
    super.key,
    required this.bloc,
  });

  @override
  State<CompaniesForm> createState() => _CompaniesFormState();
}

class _CompaniesFormState extends State<CompaniesForm> {
  // late String name = "";
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  labelText: 'Company',
                ),
                controller: name,
                // onChanged: (value) => name = value,
              ),
              ElevatedButton(
               child: const Icon(Icons.add,),
              style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 202, 159, 255)),
              onPressed: () {
                  if (name.text != "") {
                    locator.get<FirebaseService>().addCompany(name.text);
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
