import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spndPerceofTotal;

  ChartBar(this.label, this.spendingAmount, this.spndPerceofTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
            child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
        SizedBox(
          height: 4,
        ),
        Container(
          height:  60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.brown,width: 0.8),
                  color: Color.fromRGBO(220, 220, 220, 2),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spndPerceofTotal,
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 10,
            child: FittedBox(child: Text(label))),
      ],
    );
  }
}
