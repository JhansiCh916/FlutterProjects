import './widgets/new_transaction.dart';
import '../widgets/transactionList.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Planner",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amberAccent,
      ),
      home: HomePage(),
      );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (_) {
      return GestureDetector(
        onTap: () {},
        child: NewTransaction(_addTransactions),
        behavior: HitTestBehavior.opaque,
      );

    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ExpensePalnner"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
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
              color: Theme.of(context).primaryColor,
              child: Text("Chart!"),
              elevation: 5,
            ),
          ),
          TransactionList(_userTransactions),
        ],
      ),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () => _startNewTransaction(context),
    ),
    );
  }
}