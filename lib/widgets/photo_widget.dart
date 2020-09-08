import 'package:flutter/material.dart';
import 'package:pixabay_galery/pages/photo_page.dart';

import '../models/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;
  const PhotoWidget({Key key, this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Image.network(photo.previewURL),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PhotoPage(
                  photo: photo,
                )));
      },
    );
  }
}
