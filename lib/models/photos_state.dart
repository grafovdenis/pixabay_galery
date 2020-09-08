import 'photo.dart';

abstract class PhotosState {}

class PhotosLoadingState extends PhotosState {}

class PhotosLoadedState extends PhotosState {
  final List<Photo> photos;
  final int page;

  PhotosLoadedState({this.photos, this.page});

  PhotosLoadedState copyWith({List<Photo> photos, int page}) {
    final _photos = this.photos;
    if (photos != null) {
      _photos.addAll(photos);
    }
    return PhotosLoadedState(
      page: page ?? this.page,
      photos: _photos,
    );
  }
}
