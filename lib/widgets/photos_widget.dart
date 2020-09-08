import 'package:flutter/material.dart';

import '../actions/action.dart';
import '../blocs/bloc_provider.dart';
import '../blocs/photos_bloc.dart';
import '../models/photo.dart';
import 'photo_widget.dart';

class PhotosWidget extends StatelessWidget {
  final List<Photo> photos;
  final int page;
  const PhotosWidget({Key key, this.photos, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PhotosBloc bloc = BlocProvider.of<PhotosBloc>(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification.metrics.pixels ==
            scrollNotification.metrics.maxScrollExtent) {
          // bloc.action.add(LoadPhotosAction(page: page + 1));
          print("end");
        }
      },
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return PhotoWidget(
            photo: photos[index],
          );
        },
      ),
    );
  }
}
