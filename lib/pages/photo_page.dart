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
          Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.file_download),
              onPressed: () {
                PhotosRepository.savePhoto(photo).whenComplete(
                    () => Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Photo ${photo.id} saved"),
                        )));
              },
            );
          })
        ],
      ),
      body: Center(
        child: Image.network(photo.largeImageURL),
      ),
    );
  }
}
