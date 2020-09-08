import 'package:flutter/material.dart';

import '../models/photo.dart';

class PhotoPage extends StatelessWidget {
  final Photo photo;
  const PhotoPage({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.network(photo.largeImageURL),
      ),
    );
  }
}
