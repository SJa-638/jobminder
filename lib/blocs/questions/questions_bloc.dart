
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobminder/blocs/questions/questions_events.dart';
import 'package:jobminder/blocs/questions/questions_states.dart';


class QuestionsBloc extends Bloc<QuestionsEvent,QuestionsState>{
  QuestionsBloc() : super(const QuestionsInitialState()) {
    on<AddQuestionEvent>(_onAddQuestionEvent,);
  }

  void _onAddQuestionEvent(
    AddQuestionEvent event,
    Emitter<QuestionsState> emitter,
  ) async {
    emitter(const QuestionsInitialState());
    // ignore: unnecessary_null_comparison
    if (event.newQ == null) {
      emitter(const QuestionsErrorAddState(
        errorMessage: "something went very wrong :(",
      ));
    } else {
      event.questions.add(event.newQ);
      emitter(QuestionsSuccessAddState(event.questions));
    }
  }
  
}