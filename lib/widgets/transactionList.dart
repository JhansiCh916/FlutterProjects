import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
      child: Column(
        children: transactions.map((tx) {
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
                            tx.title,
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                              "Date " + DateFormat("dd-mm-yyyy").format(tx.date)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent, width: 0.8)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "\$" + tx.amount.toString(),
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
      )
    );
  }
}
