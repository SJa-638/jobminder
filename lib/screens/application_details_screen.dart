import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_events.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_states.dart';
import 'package:jobminder/modules/application.dart';
import 'package:jobminder/modules/application_state.dart';

class ApplicationDetailsScreen extends StatefulWidget {
    final Application application;
  const ApplicationDetailsScreen({super.key, required this.application});

  @override
  State<ApplicationDetailsScreen> createState() => _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {
  late ApplicationDetailsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApplicationDetailsBloc>();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // height: MediaQuery.of(context).size.height * 0.5,
          children: [
            Text(widget.application.postion),
            BlocBuilder <ApplicationDetailsBloc, ApplicationDetailsState>(
              builder: (context, state){
                if(state is ApplicationDetailsInitialState || state is ApplicationDetailsErrorAddDataState){
                  return Column(
                    children: [
                      const Text("Something went very wrong :("),
                      ElevatedButton(
                        onPressed: () {
                          bloc.add(AddStateEvent(widget.application, 
                                ApplicationState(JobStatus.jobForm,
                                DateTime.now().add(const Duration(days: 15)) ,
                                DateTime.now())
                              )
                            );
                          }, 
                          child: const Text("Add state"),
                      ),
                    ],
                  );
                } else {
                  return Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                                itemCount: widget.application.appStates.length,
                                itemBuilder: (context, index){
                                  return Text(widget.application.appStates[index].jobStatuses.name);
                                }
                              ),
                        ),
                            ElevatedButton(
                        onPressed: () {
                          bloc.add(AddStateEvent(widget.application, 
                                ApplicationState(JobStatus.jobForm,
                                DateTime.now().add(const Duration(days: 15)) ,
                                DateTime.now())
                              )
                            );
                          }, 
                          child: const Text("Add state"),
                          )
                      ],
                    ),
                  );

                }
              }
            ),
          ],
        ),
      ),
    );
  }
}
