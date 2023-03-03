import 'dart:ffi';

import 'package:expenses/chart/chart.widget.dart';
import 'package:expenses/modal/transaction.form.dart';
import 'package:expenses/modal/transaction-modal.widget.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'list/list-transactions.widget.dart';

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
      home: const HomePage(),
    );
  }
}

class _HomePageState extends State<HomePage> {
  TransactionForm form = TransactionForm();

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builderContext) {
        return TransactionModal(
          transactionForm: form,
          onSubmit: () {
            if (form.title.text.isEmpty || form.value.text.isEmpty) {
              return;
            }

            setState(() {
              final transaction = Transaction(
                id: nextId,
                title: form.title.text,
                value: double.parse(form.value.text),
                date: DateTime.now(),
              );
              _transactions.add(transaction);
              form.reset();
              Navigator.of(context).pop();
            });
          },
        );
      },
    );
  }

  final _transactions = [
    Transaction(
      id: 1,
      title: "Novo Tênis Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: "Conta de Luz",
      value: 211.30,
      date: DateTime.now(),
    ),
    Transaction(
      id: 3,
      title: "Novo Tênis Corrida",
      value: 310.76,
      date: DateTime.now(),
    ),
  ];

  int get nextId {
    return _transactions.last != null && _transactions.last.id > 0
        ? _transactions.last.id + 1
        : 1;
  }

  @override
  Widget build(BuildContext context) {
    var total = 0;

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Expenses"),
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
              onPressed: () => _openTransactionModal(context),
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
            ),
            child: Column(
              children: [
                Chart(),
                ListTransactions(transactions: _transactions),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.purple,
          child: const Icon(Icons.add),
          onPressed: () => _openTransactionModal(context),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => _HomePageState();
}
