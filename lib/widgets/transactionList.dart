import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            width: 400,
            height: 100,
            child: Card(
              child: Container(
                width: 200,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Date " + DateFormat("dd-mm-yyyy").format(transactions[index].date)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                          border:
                          Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 0.8)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$" + transactions[index].amount.toStringAsFixed(2),
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),

    );
  }
}
