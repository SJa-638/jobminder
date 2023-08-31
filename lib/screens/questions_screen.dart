import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/questions/questions_bloc.dart';
import 'package:jobminder/blocs/questions/questions_states.dart';
import 'package:jobminder/main.dart';
import 'package:jobminder/modules/question.dart';
import 'package:jobminder/screens/drawer_widget.dart';
import 'package:jobminder/utilites/db.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
  });

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late QuestionsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<QuestionsBloc>();
    locator.get<FirebaseService>().listenToQuestions(bloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Questions"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return QuestionsForm(
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
          child: BlocBuilder<QuestionsBloc, QuestionsState>(
              builder: (context, state) {
            if (state is QuestionsInitialState ||
                state is QuestionsSuccessAddState) {
              return ListView.builder(
                  itemCount: state.props.length,
                  itemBuilder: (context, index) {
                    var q = state.props[index] as Question;
                    return GestureDetector(
                      onTap: () {
                        // print(widget.Questions[index].name);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //       BlocProvider(
                        //         create: (context) => ApplicationDetailsBloc(),
                        //         child: ApplicationDetailsScreen(application: app),
                        //       ),
                        //   ),
                        // )
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(q.question),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (state is QuestionsErrorAddState) {
              return Text(state.errorMessage);
            } else {
              return const Text("Something went very wrong :(");
            }
          })),
    );
  }
}

class QuestionsForm extends StatefulWidget {
  final QuestionsBloc bloc;

  const QuestionsForm({
    super.key,
    required this.bloc,
  });

  @override
  State<QuestionsForm> createState() => _QuestionsFormState();
}

class _QuestionsFormState extends State<QuestionsForm> {
  TextEditingController q = TextEditingController();
  TextEditingController ans = TextEditingController();

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
                  labelText: 'Question',
                ),
                controller: q,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Answer',
                ),
                controller: ans,
              ),
              ElevatedButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  if (q.text != "") {
                    final question =
                        Question(question: q.text, answer: ans.text);
                    locator.get<FirebaseService>().addQuestion(question);
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
