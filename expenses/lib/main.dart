import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Expenses());

class Expenses extends StatelessWidget {
  const Expenses({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _transactions = [
    Transaction(
      id: "t1",
      title: "Novo Tênis Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Conta de Luz",
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t3",
      title: "Novo Tênis Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var total = 0;

    return Center(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Expenses"),
            backgroundColor: Colors.purple,
          ),
          body: Container(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Column(
              children: [
                const SizedBox(
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
                ),
                Card(
                  color: Colors.purple,
                  elevation: 5,
                  child: Column(
                    children: [
                      const Text(
                        "Lista Transações",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      ..._transactions.map((transaction) {
                        // total
                        return Card(
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 10,
                                ),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.purple,
                                  ),
                                ),

                                child: Text(
                                  "R\$ ${transaction.value.toStringAsFixed(2).replaceAll("/\\./", ",")}",
                                  style: const TextStyle(
                                      color: Colors.purple,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Text(
                                      transaction.title,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Text(
                                      transaction.date.toIso8601String(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList()
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
