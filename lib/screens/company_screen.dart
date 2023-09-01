import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_bloc.dart';
import 'package:jobminder/blocs/compnies/compnies_events.dart';
import 'package:jobminder/blocs/compnies/compnies_states.dart';
import 'package:jobminder/screens/drawer_widget.dart';

import '../modules/company.dart';

class CompaniesScreen extends StatefulWidget {
  final List<Company> companies;

  const CompaniesScreen({
    super.key,
    required this.companies,
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
                context: context,
                builder: (BuildContext context) {
                  return CompaniesForm(
                    companies: widget.companies,
                    bloc: bloc,
                  );
                },
              );
            },
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: BlocBuilder<CompaniesBloc, CompaniesState>(
              builder: (context, state) {
            if (state is CompaniesInitialState ||
                state is CompaniesSuccessAddState) {
              return ListView.builder(
                  itemCount: widget.companies.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // print(widget.companies[index].name);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(widget.companies[index].name),
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
  final List<Company> companies;
  final CompaniesBloc bloc;

  const CompaniesForm({
    super.key,
    required this.companies,
    required this.bloc,
  });

  @override
  State<CompaniesForm> createState() => _CompaniesFormState();
}

class _CompaniesFormState extends State<CompaniesForm> {
  late String name = "";

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Company',
            ),
            onChanged: (value) => name = value,
            ),
            ElevatedButton(
              child: const Icon(Icons.add,),
              style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 202, 159, 255)),
              onPressed: () {
                if (name != "") {
                  widget.bloc.add(
                      AddcompanyEvent(Company(name: name), widget.companies));
                }
                Navigator.pop(context);
              },
              
            ),
          ],
        ),
      ),
    );
  }
}
