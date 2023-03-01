import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionaireResult extends StatelessWidget {
  void Function() onRestart;

  QuestionaireResult({
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Parabéns",
            style: TextStyle(fontSize: 28),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
            onPressed: onRestart,
            child: Text("Reiniciar"),
          ),
        ],
      )),
    );
  }
}
