import 'package:expense_planner/widgets/transactionList.dart';

import '../widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "jsafdhsfjsdfjsd",
      home: HomePage(),
      );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpensePalnner"),
      ),
      body: SingleChildScrollView(
        child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          Container(
            width: 400,
            child: Card(
              color: Colors.blue,
              child: Text("Chart!"),
              elevation: 5,
            ),
          ),
          UserTransactions(),
        ],
      )
      )
    );
  }
}