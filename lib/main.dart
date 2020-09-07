import 'package:flutter/material.dart';
import 'package:pixabay_galery/blocs/photos_bloc.dart';
import 'package:pixabay_galery/repository/photos_repository.dart';

import 'blocs/bloc_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PhotosBloc>(
      bloc: PhotosBloc(PhotosRepository()),
      child: MaterialApp(
        title: 'Pixabay Galery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
