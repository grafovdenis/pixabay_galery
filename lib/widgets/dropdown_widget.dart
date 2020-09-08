import 'package:flutter/material.dart';
import 'package:pixabay_galery/models/filter.dart';
import 'package:pixabay_galery/utils/filter_to_color.dart';

import '../actions/action.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/photos_bloc.dart';

class DropdownWidget extends StatefulWidget {
  DropdownWidget({Key key}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final PhotosBloc bloc = BlocProvider.of<PhotosBloc>(context);
    return PopupMenuButton(
      initialValue: value,
      icon: Icon(
        Icons.palette,
        color: fiterToColor(Filter.values[value]),
      ),
      itemBuilder: (_) => Filter.values
          .map(
            (Filter e) => PopupMenuItem(
              child: Text((e.toShortString() == "none")
                  ? "Any color"
                  : e.toShortString()),
              value: e.index,
            ),
          )
          .toList(),
      onSelected: (index) {
        bloc.action
            .add(LoadPhotosAction(filter: Filter.values[index], page: 1));
        setState(() {
          value = index;
        });
      },
    );
  }
}
