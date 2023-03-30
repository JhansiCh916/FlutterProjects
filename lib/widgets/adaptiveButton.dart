import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class AdaptiveButton extends StatelessWidget {
  // final String text;
  final VoidCallback handler;

  AdaptiveButton(this.handler);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              "Choose date",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: handler)
        : TextButton(
            onPressed: handler,
            child: Text(
              "Choose date",
              style: Theme.of(context).textTheme.titleMedium,
            ));
  }
}
