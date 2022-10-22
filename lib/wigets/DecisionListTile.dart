import 'package:flutter/material.dart';

class DecisionListTile extends StatelessWidget {
  final String title;
  final bool selected;
  final void Function() onTap;

  DecisionListTile({this.title, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: selected ? Icon(Icons.check) : null,
      onTap: onTap,
    );
  }
}
