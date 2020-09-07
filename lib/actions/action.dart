import 'package:pixabay_galery/models/filter.dart';

abstract class Action {}

abstract class PhotosAction extends Action {}

class LoadPhotosAction extends PhotosAction {
  final Filter filter;
  final int page;

  LoadPhotosAction({this.filter, this.page});
}
