import 'package:equatable/equatable.dart';
import 'package:jobminder/modules/question.dart';

abstract class QuestionsEvent extends Equatable {
  const QuestionsEvent();
}

class AddQuestionEvent extends QuestionsEvent {
  final Question newQ;
  final List<Question> questions;

  const AddQuestionEvent(this.newQ, this.questions);

  @override
  List<Object?> get props => [];
}
