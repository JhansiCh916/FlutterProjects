import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrasactions;

  Chart(this.recentTrasactions);

  List<Map<String, Object>> get groupedTrasactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;

      for (var i = 0; i < recentTrasactions.length; i++) {
        if ( recentTrasactions[i].date.day == weekDay.day &&
            recentTrasactions[i].date.month == weekDay.month &&
            recentTrasactions[i].date.year == weekDay.year) {
          totalSum += recentTrasactions[i].amount;

        }
      }
      return {"day": DateFormat.E().format(weekDay).substring(0,1), "amount" : totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTrasactions.fold(0.0, (sum, item) {
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: groupedTrasactions.map((data) {

            return Flexible(fit: FlexFit.tight,
                child: ChartBar(data["day"].toString(), (data["amount"] as double), maxSpending == 0 ? 0.0 : (data["amount"] as double) / maxSpending));
          }).toList(),
        ),
      ),
    );
  }
}
