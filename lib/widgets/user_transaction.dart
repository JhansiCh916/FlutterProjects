import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transactionList.dart';
import 'package:flutter/cupertino.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() {
    return UserTransactionsState();
  }
}

class UserTransactionsState extends State<UserTransactions> {

  final List<Transaction> _userTransactions = [
    Transaction("t1", 650, "Shoes", DateTime.now()),
    Transaction("t2", 500, "Kurti", DateTime.now()),
    Transaction("t3", 250, "cups", DateTime.now())
  ];

  void _addTransactions( String id, String title, double amount) {
    final newTx = Transaction(id, amount,
        title, DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransactions),
        TransactionList(_userTransactions)
      ],
    );
  }
}



