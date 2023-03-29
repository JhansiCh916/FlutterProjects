import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titlecontroller = TextEditingController();
  final amountController = TextEditingController();
  final idController = TextEditingController();

  final Function AddUserTransaction;

  NewTransaction(this.AddUserTransaction);

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
                labelText: "Enter title"),controller: titlecontroller,
            ),
            TextField(decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                labelText: "Enter Amount"),controller: amountController,),
            TextField(decoration: InputDecoration(contentPadding: EdgeInsets.all(5),
                labelText: "Enter id"),controller: idController,),
            TextButton(onPressed: () {
              AddUserTransaction(idController.text,titlecontroller.text,double.parse(amountController.text));
            }, child: Text("Add Transaction",
              style: TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold, fontSize: 15),))
          ],
        )
    )
      );
  }
}
