import 'package:flutter/material.dart';

class BlocProvider<Bloc> extends InheritedWidget {
  final Bloc bloc;

  BlocProvider({Key key, this.bloc, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of<Bloc>(BuildContext context) {
    return context.findAncestorWidgetOfExactType<BlocProvider<Bloc>>().bloc;
  }
}
