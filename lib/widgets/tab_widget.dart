import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  String title;
  TabWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Tab(
          child: FittedBox(
            child: Text(title),
          ),
        );
  }
}