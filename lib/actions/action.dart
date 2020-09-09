import 'package:pixabay_galery/models/filter.dart';

abstract class Action {}

abstract class PhotosAction extends Action {}

class LoadPhotosAction extends PhotosAction {
  final int page;

  LoadPhotosAction({this.page});
}

class LoadPhotosWithNewFilterAction extends PhotosAction {
  final Filter filter;

  LoadPhotosWithNewFilterAction({this.filter});
}
