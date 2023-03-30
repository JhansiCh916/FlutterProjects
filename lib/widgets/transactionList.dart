import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text("No transactions added", style: Theme.of(context).textTheme.titleMedium,),
                  SizedBox(
                    height: constraint.maxHeight * 0.05,
                  ),
                  Container(
                      height: constraint.maxHeight * 0.6,
                      child: Image.asset("assets/images/thinking.jpg")),
                ],
              )
            : ListView.builder(
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
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                      ),
                      trailing:MediaQuery.of(context).size.width > 440 ?
                          TextButton.icon(icon: Icon(Icons.delete),label: Text("Delete"),onPressed: () =>
                              deleteTransaction(transactions[index].id))
                       : IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.red,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
      );
    });
  }
}
