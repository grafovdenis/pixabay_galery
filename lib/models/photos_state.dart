import 'filter.dart';
import 'photo.dart';

abstract class PhotosState {}

class PhotosLoadingState extends PhotosState {}

class PhotosLoadedState extends PhotosState {
  final List<Photo> photos;
  final int page;
  final Filter filter;

  PhotosLoadedState({this.photos, this.page, this.filter});

  PhotosLoadedState copyWith({List<Photo> photos, int page, Filter filter}) {
    final _photos = this.photos;
    if (photos != null) {
      _photos.addAll(photos);
    }
    return PhotosLoadedState(
      page: page ?? this.page,
      photos: _photos,
      filter: filter ?? this.filter,
    );
  }
}
