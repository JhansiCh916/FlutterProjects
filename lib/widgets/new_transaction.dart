import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function AddUserTransaction;

  NewTransaction(this.AddUserTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titlecontroller = TextEditingController();

  final amountController = TextEditingController();

  final idController = TextEditingController();

  void submitData() {
    final enteredTitle = titlecontroller.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredId = idController.text;
    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredId.isEmpty ) {
      return;
    }
    widget.AddUserTransaction(enteredId,enteredTitle,enteredAmount);
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return
      Card(
        child:
      Container(
        width: 400,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                labelText: "Enter title"),controller: titlecontroller,onSubmitted: (_) => submitData()
            ),
            TextField(decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                labelText: "Enter Amount"),controller: amountController,
                keyboardType: TextInputType.numberWithOptions(),onSubmitted: (_) => submitData()),
            TextField(decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                labelText: "Enter id"),controller: idController,onSubmitted: (_) => submitData()),
            TextButton(onPressed: submitData, child: Text("Add Transaction",
              style: Theme.of(context).textTheme.titleMedium,))
          ],
        )
    )
      );
  }
}
