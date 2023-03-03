import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.purple,
        elevation: 5,
        child: Text(
          "Gráfico",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}