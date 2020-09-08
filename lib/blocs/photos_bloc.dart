import 'dart:async';

import 'package:pixabay_galery/actions/action.dart';
import 'package:pixabay_galery/models/photos_state.dart';
import 'package:pixabay_galery/repository/photos_repository.dart';

import '../actions/action.dart';
import '../models/photos_state.dart';
import '../repository/photos_repository.dart';
import 'bloc.dart';

class PhotosBloc extends Bloc {
  PhotosState _currentState = PhotosLoadingState();

  final _stateController = StreamController<PhotosState>();
  final _actionController = StreamController<PhotosAction>()
    ..add(LoadPhotosAction(page: 1));

  Stream<PhotosState> get state => _stateController.stream;
  Sink<PhotosAction> get action => _actionController.sink;

  void _handleAction(PhotosAction action) async {
    if (action is LoadPhotosAction) {
      _currentState = PhotosLoadingState();
      _stateController.sink.add(_currentState);
      final photos = await PhotosRepository.getPhotos(
        filter: action.filter,
        page: action.page,
      );
      _currentState = PhotosLoadedState(photos: photos);
      _stateController.sink.add(_currentState);
    }
  }

  PhotosBloc() {
    _actionController.stream.listen(_handleAction);
  }

  @override
  void dispose() {
    _stateController.close();
    _actionController.close();
  }
}
