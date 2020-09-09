import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../repository/photos_repository.dart';

class PhotoPage extends StatelessWidget {
  final Photo photo;
  const PhotoPage({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.file_download),
            onPressed: () {
              PhotosRepository.savePhoto(photo);
            },
          )
        ],
      ),
      body: Center(
        child: Image.network(photo.largeImageURL),
      ),
    );
  }
}
