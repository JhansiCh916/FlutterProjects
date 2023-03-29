import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 300,
      child: transactions.isEmpty ? Column(
        children: [
          Text("No transactions added"),
          SizedBox(
            height: 10,
          ),
          Image.asset("assets/images/thinking.jpg"),
        ],
      ): ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${transactions[index].amount}'),
                ),
              ),
              title: Text(transactions[index].title, style: Theme.of(context).textTheme.titleMedium,),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date),),
              trailing: IconButton(icon: Icon(Icons.delete),color: Colors.red,onPressed: () => deleteTransaction(transactions[index].id),),
            ),
          );
        },
        itemCount: transactions.length,
      ),

    );
  }
}
