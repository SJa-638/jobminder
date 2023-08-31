import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications/applications_bloc.dart';
import 'package:jobminder/blocs/applications/applications_states.dart';
import 'package:jobminder/modules/company.dart';

class ApplicationsScreen extends StatefulWidget {
  
  final Company company;
  const ApplicationsScreen({super.key, required this.company});

  @override
  State<ApplicationsScreen> createState() => _ApplicationsScreenState();
}

class _ApplicationsScreenState extends State<ApplicationsScreen> {

  late ApplicationsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApplicationsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.company.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<ApplicationsBloc, ApplicationsState>(
          builder: (context, state){
            if(state is ApplicationsInitialState){
              return const Text("init");
            }else{
              return const Text("other");
            }
        }),
      ),
    );
  }
}