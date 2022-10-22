import './DecisionListTile.dart';
import 'package:flutter/material.dart';

class DecisionList extends StatefulWidget {
  final void Function(int x) onTap;
  final List<String> items;
  final int defaultSelected;
  DecisionList({this.onTap, this.items, this.defaultSelected});

  @override
  _DecisionListState createState() => _DecisionListState();
}

class _DecisionListState extends State<DecisionList> {
  int selected;

  void onTapHandler(int index) {
    setState(() {
      this.selected = index;
      widget.onTap(this.selected);
    });
  }

  @override
  void initState() {
    this.selected = widget.defaultSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (ctx, i) {
        return DecisionListTile(
          title: widget.items[i],
          selected: selected == i,
          onTap: () => onTapHandler(i),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          color: Colors.blue[800],
          thickness: 1.0,
          height: 1.0,
        );
      },
    );
  }
}
