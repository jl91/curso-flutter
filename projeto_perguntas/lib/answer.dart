import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  String answer;

  void Function() onChooseAnswer;

  Answer({required this.answer, required this.onChooseAnswer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        onPressed: onChooseAnswer,
        child: Text(answer),
      ),
    );
  }
}
