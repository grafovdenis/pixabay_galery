import 'dart:async';

import 'package:pixabay_galery/actions/action.dart';
import 'package:pixabay_galery/models/photos_state.dart';
import 'package:pixabay_galery/repository/photos_repository.dart';

abstract class Bloc {
  void dispose();
}

class PhotosBloc extends Bloc {
  final PhotosRepository _repository;

  final _stateController = StreamController<PhotosState>();
  final _actionController = StreamController<PhotosAction>();

  Stream<PhotosState> get state => _stateController.stream;
  Sink<PhotosAction> get action => _actionController.sink;

  void _handleAction(PhotosAction action) async {}

  PhotosBloc(this._repository) {
    _actionController.stream.listen(_handleAction);
  }

  @override
  void dispose() {
    _stateController.close();
    _actionController.close();
  }
}
