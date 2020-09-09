import 'dart:async';

import 'package:pixabay_galery/actions/action.dart';
import 'package:pixabay_galery/models/photos_state.dart';
import 'package:pixabay_galery/repository/photos_repository.dart';

import '../actions/action.dart';
import '../models/filter.dart';
import '../models/photos_state.dart';
import '../repository/photos_repository.dart';
import 'bloc.dart';

class PhotosBloc extends Bloc {
  PhotosState _currentState = PhotosLoadingState();
  bool isLoading = false;

  final _stateController = StreamController<PhotosState>();
  final _actionController = StreamController<PhotosAction>()
    ..add(LoadPhotosWithNewFilterAction(filter: Filter.none));

  Stream<PhotosState> get state => _stateController.stream;
  Sink<PhotosAction> get action => _actionController.sink;

  void _handleAction(PhotosAction action) async {
    if (action is LoadPhotosAction) {
      if (!isLoading) {
        if (_currentState is PhotosLoadedState) {
          final _filter = (_currentState as PhotosLoadedState).filter;
          isLoading = true;
          final newPhotos = await PhotosRepository.getPhotos(
              filter: _filter, page: action.page);
          _currentState = (_currentState as PhotosLoadedState)
              .copyWith(photos: newPhotos, page: action.page, filter: _filter);
          _stateController.sink.add(_currentState);
          isLoading = false;
        }
      }
    }
    if (action is LoadPhotosWithNewFilterAction) {
      _currentState = PhotosLoadingState();
      _stateController.sink.add(_currentState);
      final photos =
          await PhotosRepository.getPhotos(filter: action.filter, page: 1);
      _currentState =
          PhotosLoadedState(photos: photos, page: 1, filter: action.filter);
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
