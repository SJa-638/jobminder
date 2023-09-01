import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/question.dart';

abstract class QuestionsState extends Equatable {
  const QuestionsState();
}

class QuestionsInitialState extends QuestionsState {
  const QuestionsInitialState();

  @override
  List<Object?> get props => [];
}

class QuestionsErrorAddState extends QuestionsState {
  final String errorMessage;
  const QuestionsErrorAddState({
    required this.errorMessage,
  });

  @override
  List<Object?> get props => [];
}

class QuestionsSuccessAddState extends QuestionsState {
  final List<Question> questions;
  const QuestionsSuccessAddState(this.questions);

  @override
  List<Question> get props => questions;
}
