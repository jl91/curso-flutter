import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/answer.dart';

class Question extends StatelessWidget {
  String question;

  void Function(int answerIndex) onAnswerQuestion;

  Set<String> answers;

  bool showQuestion;

  Question({
    required this.question,
    required this.answers,
    required this.onAnswerQuestion,
    this.showQuestion = true,
  });

  @override
  Widget build(BuildContext context) {
    int answerIndex = 0;
    return Visibility(
      visible: this.showQuestion,
      child: Container(
        child: Column(children: [
          Text(
            question,
            style: const TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
          ...answers.map((element) {
            final answerIndexCopy = answerIndex++;
            return Answer(
              answer: element,
              onChooseAnswer: () => onAnswerQuestion(answerIndexCopy),
            );
          }).toList(),
        ]),
      ),
    );
  }
}
