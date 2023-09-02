import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/applications/applications_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_bloc.dart';
import 'package:jobminder/blocs/applications_detailes/applications_detailes_states.dart';
import 'package:jobminder/main.dart';
import 'package:jobminder/modules/application.dart';
import 'package:jobminder/modules/application_state.dart';
import 'package:jobminder/screens/applications_screen.dart';
import 'package:jobminder/utilites/db.dart';

class ApplicationDetailsScreen extends StatefulWidget {
  const ApplicationDetailsScreen({super.key});

  @override
  State<ApplicationDetailsScreen> createState() =>
      _ApplicationDetailsScreenState();
}

class _ApplicationDetailsScreenState extends State<ApplicationDetailsScreen> {
  late ApplicationDetailsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<ApplicationDetailsBloc>();
    locator.get<FirebaseService>().listenToApplicationStates(bloc, bloc.app);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color.fromARGB(255, 210, 173, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(bloc.app.company.name),
        leading: BackButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => ApplicationsBloc(),
                child: ApplicationsScreen(company: bloc.app.company),
              ),
            ),
          );
        }),
      ),
     body: Padding(
  padding: EdgeInsets.all(25.0),
  child: Wrap(
    spacing: 20,
    runSpacing: 20,
    children: [
      Row(
        children: [
          const Text("Position: "),
          Text(bloc.app.postion),
        ],
      ),
      BlocBuilder<ApplicationDetailsBloc, ApplicationDetailsState>(
        builder: (context, state) {
          locator.get<FirebaseService>().listenToApplicationStates(bloc, bloc.app);
          if (state is ApplicationDetailsSuccessAddDataState ||
              state is ApplicationDetailsInitialState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("States:"),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Scrollbar(
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: ListView.builder(
                            itemCount: state.getApp.appStates.length,
                            itemBuilder: (context, index) {
                              Application myapp = state.getApp;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(myapp.appStates[index].jobStatuses.name),
                                  Text(' Deadline: ${_formatDate(myapp.appStates[index].deadline)}'),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                
                      ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ApplicationStateForm(
                                bloc: bloc,
                                application: state.getApp,
                              );
                            },
                          );
                        },
                        child: const Text("Add state"),
                         style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 151, 66, 255)),
                      )
                    ],
                  ),
                );
              } else {
                return const Text("Something went very wrong :(");
              }
            }),
            Row(
              children: [
                const Text("Job Type: "),
                Text(bloc.app.jobType.name),
              ],
            ),
            Row(
              children: [
                const Text("Work Modle: "),
                Text(bloc.app.workModle.name),
              ],
            ),
            Row(
              children: [
                const Text("notes: "),
                Text(bloc.app.notes ?? "No Notes"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationStateForm extends StatefulWidget {
  final ApplicationDetailsBloc bloc;
  final Application application;
  const ApplicationStateForm(
      {super.key, required this.bloc, required this.application});

  @override
  State<ApplicationStateForm> createState() => _ApplicationStateFormState();
}

class _ApplicationStateFormState extends State<ApplicationStateForm> {
  late DateTime dueDate = DateTime.now();
  late JobStatus newStateStatus = JobStatus.jobForm;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            DropdownButton<JobStatus>(
                value: newStateStatus,
                onChanged: (value) {
                  setState(() {
                    newStateStatus = value!;
                  });
                },
                items: JobStatus.values.map((JobStatus classType) {
                  return DropdownMenuItem<JobStatus>(
                      value: classType, child: Text(classType.name));
                      
                }).toList()),
            ElevatedButton(
              onPressed: _selectDate,
              child: Text('Due Date: ${_formatDate(dueDate)}'),
               style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 202, 159, 255)),
               
            ),
            ElevatedButton(
              child: const Icon(Icons.add),
               style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 202, 159, 255)),
              onPressed: () {
                ApplicationState newState =
                    ApplicationState(newStateStatus, dueDate, DateTime.now());
                // widget.bloc.add(AddStateEvent(widget.application, newState));
                locator
                    .get<FirebaseService>()
                    .addApplicationState(newState, widget.application.id);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null && pickedDate != dueDate) {
      setState(() {
        dueDate = pickedDate;
      });
    }
  }
}

String _formatDate(DateTime date) {
  return '${date.day}/${date.month}/${date.year}';
}
