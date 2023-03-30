import '../widgets/adaptiveButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function AddUserTransaction;

  NewTransaction(this.AddUserTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();
  final _amountController = TextEditingController();
  final idController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    final enteredTitle = _titlecontroller.text;
    final enteredAmount = double.parse(_amountController.text);
    final enteredId = idController.text;
    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        enteredId.isEmpty ||
        _selectedDate == null) {
      return;
    }
    widget.AddUserTransaction(
        enteredId, enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _showdatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2016),
            lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          child: Container(
              width: 400,
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Enter title"),
                      controller: _titlecontroller,
                      onSubmitted: (_) => _submitData()),
                  TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Enter Amount"),
                      controller: _amountController,
                      keyboardType: TextInputType.numberWithOptions(),
                      onSubmitted: (_) => _submitData()),
                  TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Enter id"),
                      controller: idController,
                      onSubmitted: (_) => _submitData()),
                  Container(
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(_selectedDate == null
                                ? "No date chosen"
                                : DateFormat.yMd()
                                    .format(_selectedDate ?? DateTime.now()))),
                        AdaptiveButton(_showdatePicker)
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _submitData,
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(
                          backgroundColor: Theme.of(context).primaryColor,
                          color: Colors.white),
                    ),
                  )
                ],
              ))),
    );
  }
}
