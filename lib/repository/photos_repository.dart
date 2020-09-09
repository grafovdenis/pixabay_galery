import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import '../api_client.dart';
import '../models/filter.dart';
import '../models/photo.dart';

class PhotosRepository {
  static Future<List<Photo>> getPhotos({Filter filter, int page}) async {
    final response = await ApiClient.getPhotos(
      color: (filter != Filter.none) ? filter.toShortString() : null,
      page: page,
    );
    if (response.statusCode == 200) {
      return compute(_parsePhotos, response.body);
    } else {
      return [];
    }
  }

  static List<Photo> _parsePhotos(String body) {
    final parsed = jsonDecode(body);

    return parsed['hits'].map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  static Future savePhoto(Photo photo) async {
    final bytes = (await ApiClient.getPhoto(photo.largeImageURL)).bodyBytes;

    final documentDirectory = await getApplicationDocumentsDirectory();
    final folder = documentDirectory.path + "/images";
    final filePathAndName = documentDirectory.path + '/images/${photo.id}.jpg';

    await Directory(folder).create(recursive: true);
    final file = File(filePathAndName);
    return file.writeAsBytesSync(bytes);
  }
}
