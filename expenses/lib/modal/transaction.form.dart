import 'package:flutter/cupertino.dart';

class TransactionForm {
  TextEditingController title = TextEditingController();
  TextEditingController value = TextEditingController();

  reset() {
    title.clear();
    value.clear();
  }
}
