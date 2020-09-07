import 'package:flutter/material.dart';
import 'package:pixabay_galery/models/filter.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({Key key}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.palette,
      ),
      itemBuilder: (_) => Filter.values
          .map(
            (Filter e) => PopupMenuItem(
              child: Text(e.toString()),
              value: e.index,
            ),
          )
          .toList(),
      onSelected: (index) {},
    );
  }
}
