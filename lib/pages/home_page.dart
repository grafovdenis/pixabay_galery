import 'package:flutter/material.dart';
import 'package:pixabay_galery/widgets/dropdown_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pixabay galery"),
        actions: [
          DropdownWidget(),
        ],
      ),
      body: Center(
        child: Text("hehe"),
      ),
    );
  }
}
