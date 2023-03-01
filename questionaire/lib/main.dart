import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/question.dart';
import 'package:projeto_perguntas/questionaire-result.dart';
import 'package:projeto_perguntas/questionaire.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  final Map<String, Set<String>> _questions = {
    "Pergunta 1": {
      "Resposta 1 Pergunta 1",
      "Resposta 2 Pergunta 1",
      "Resposta 3 Pergunta 1"
    },
    "Pergunta 2": {
      "Resposta 1 Pergunta 2",
      "Resposta 2 Pergunta 2",
      "Resposta 3 Pergunta 2"
    },
    "Pergunta 3": {
      "Resposta 1 Pergunta 3",
      "Resposta 2 Pergunta 3",
      "Resposta 3 Pergunta 3"
    },
  };

  int _currentQuestion = 0;

  late Questionaire questionaire;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perguntas"),
        ),
        body: Container(
          child: showQuestionaire
              ? Questionaire(
                  questions: this._questions,
                  chooseAnswer: chooseAnswer,
                  currentQuestion: this._currentQuestion,
                )
              : QuestionaireResult(
                  onRestart: onRestart,
                ),
        ),
      ),
    );
  }

  bool get showQuestionaire {
    return this._currentQuestion < this._questions.length;
  }

  void onRestart() {
    setState(() {
      _currentQuestion = 0;
    });
  }

  Function(int answerIndex) chooseAnswer(final int questionIndex) {
    return (final int answerIndex) {
      print("Pergunta index: $questionIndex");
      print("Resposta index:  $answerIndex");

      setState(() {
        _currentQuestion++;
      });
    };
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
