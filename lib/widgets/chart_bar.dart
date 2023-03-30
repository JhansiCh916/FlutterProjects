import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spndPerceofTotal;

  ChartBar(this.label, this.spendingAmount, this.spndPerceofTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
            height:  constraint.maxHeight * 0.6,
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
          SizedBox(
            height: constraint.maxHeight * 0.05,
          ),
          Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text(label))),
        ],
      );
    },);

  }
}
