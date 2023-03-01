import 'package:flutter/cupertino.dart';
import 'package:projeto_perguntas/question.dart';

class Questionaire extends StatelessWidget {
  Map<String, Set<String>> questions;

  int currentQuestion;

  Function(int answerIndex) Function(int questionIndex) chooseAnswer;

  Questionaire({
    required this.questions,
    required this.chooseAnswer,
    this.currentQuestion = 0,
  });

  @override
  Widget build(BuildContext context) {
    final Iterable<MapEntry<String, Set<String>>> entries = questions.entries;
    int index = 0;

    return Container(
      child: Column(
        children: [
          ...entries.map((element) {
            final showQuestion = index == this.currentQuestion;
            final indexCopy = index;
            final onPressed = chooseAnswer(indexCopy);
            index++;
            return Question(
              showQuestion: showQuestion,
              question: element.key,
              answers: element.value,
              onAnswerQuestion: onPressed,
            );
          }).toList()
        ],
      ),
    );
  }
}
