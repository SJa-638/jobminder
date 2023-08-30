import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // late ApplicationDetailsBloc bloc;

  @override
  void initState() {
    super.initState();
    // bloc = context.read<ApplicationDetailsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Companies"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CompaniesForm(
                    companies: widget.companies,
                  );
                },
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
            itemCount: widget.companies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(widget.companies[index].name);
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
            }),
      ),
    );
  }
}

class CompaniesForm extends StatefulWidget {
  final List<Company> companies;

  const CompaniesForm({
    super.key,
    required this.companies,
  });

  @override
  State<CompaniesForm> createState() => _CompaniesFormState();
}

class _CompaniesFormState extends State<CompaniesForm> {
  late String name;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Company',
            )),
            ElevatedButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
