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
      appBar: AppBar( title: Text(widget.application.company.name)),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Wrap(
          // crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          runSpacing: 20,
          // height: MediaQuery.of(context).size.height * 0.5,
          children: [
            Row(
              children: [
                const Text("Position: "),
                Text(widget.application.postion),
              ],
            ),
            BlocBuilder <ApplicationDetailsBloc, ApplicationDetailsState>(
              builder: (context, state){
                if(state is ApplicationDetailsErrorAddDataState){
                  return const Text("Something went very wrong :(");
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("States: "),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Scrollbar(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: ListView.builder(
                                      itemCount: widget.application.appStates.length,
                                      itemBuilder: (context, index){
                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(widget.application.appStates[index].jobStatuses.name),
                                            Text(' Deadline: ${widget.application.appStates[index].deadline.day.toString()} /${widget.application.appStates[index].deadline.month.toString()} / ${widget.application.appStates[index].deadline.year.toString()}'),
                                                        
                                          ],
                                        );
                                      }
                                    ),
                              ),
                            ),
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
            Row(
              children: [
                const Text("Job Type: "),
                Text(widget.application.jobType.name),
              ],
            ),
            Row(
              children: [
                const Text("Work Modle: "),
                Text(widget.application.workModle.name),
              ],
            ),
            Row(
              children: [
                const Text("notes: "),
                Text(widget.application.notes?? "No Notes"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
