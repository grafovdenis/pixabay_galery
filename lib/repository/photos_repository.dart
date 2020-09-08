import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../api_client.dart';
import '../models/filter.dart';
import '../models/photo.dart';

class PhotosRepository {
  static Future<List<Photo>> getPhotos({Filter filter, int page}) async {
    final response = await ApiClient.get(
        color: (filter != Filter.none) ? filter.toShortString() : null);
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
}
