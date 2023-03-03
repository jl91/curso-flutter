import 'package:expenses/modal/transaction.form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class TransactionModal extends StatelessWidget {
  TransactionForm transactionForm;

  void Function() onSubmit;

  TransactionModal({
    super.key,
    required this.transactionForm,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        color: Colors.purple,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: const Text(
                "Cadastrar Despesa",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Título'),
                    controller: transactionForm.title,
                    onSubmitted: (_) => onSubmit,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Valor R\$'),
                    controller: transactionForm.value,
                    onSubmitted: (_) => onSubmit,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp('[0-9.,]'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: onSubmit,
                        child: const Text(
                          "Nova Transação",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
