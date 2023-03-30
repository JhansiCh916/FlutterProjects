import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import '../widgets/transactionList.dart';
import '../models/transaction.dart';
import '../widgets/chart.dart';

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
          textTheme: ThemeData.light().textTheme.copyWith(
                  titleMedium: TextStyle(
                fontFamily: "Quicksand",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          fontFamily: "Quicksand",
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                      titleMedium: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 28,
                  )))),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _showChart = false;
  final List<Transaction> _userTransactions = [
    // Transaction("t1", 650, "Shoes", DateTime.now()),
    // Transaction("t2", 500, "Kurti", DateTime.now()),
    // Transaction("t3", 250, "cups", DateTime.now())
  ];

  void _addTransactions(
      String id, String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(id, amount, title, chosenDate);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransactions),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void delTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text("Expense Planner"),
            trailing: GestureDetector(
              child: Icon(CupertinoIcons.add),
              onTap: () => _startNewTransaction(context),
            ),
          )
        : AppBar(
            title: Text("ExpensePalnner"),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          )) as PreferredSizeWidget;
    final txWidget = Container(
        height: (mediaQuery.size.height - appBar.preferredSize.height) * 0.3,
        child: TransactionList(_userTransactions, delTransaction));
    final chartView = Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.7,
        child: Chart(_recentTransactions));
    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show Chart",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch.adaptive(
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),
            if (!isLandscape)
              Container(
                  height: (mediaQuery.size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      0.4,
                  child: Chart(_recentTransactions)),
            if (!isLandscape)
              Container(
                  height:
                      (mediaQuery.size.height - appBar.preferredSize.height) *
                          0.6,
                  child: TransactionList(_userTransactions, delTransaction)),
            if (isLandscape) _showChart == true ? chartView : txWidget,
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar as ObstructingPreferredSizeWidget,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container(
                    height: 0,
                  )
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startNewTransaction(context),
                  ),
          );
  }
}
