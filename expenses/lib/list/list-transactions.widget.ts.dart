import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListTransactions extends StatelessWidget {

  List<Transaction> transactions;

  ListTransactions({
    super.key,
    required this.transactions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
          ...transactions.map((transaction) {
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
                      "R\$ ${transaction.value.toStringAsFixed(2)}",
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
                          DateFormat("dd/MM/yyyy").format(transaction.date),
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
    );
  }
}
