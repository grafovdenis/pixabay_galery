import 'package:flutter/material.dart';

import '../models/filter.dart';

const Map<Filter, Color> colors = {
  Filter.none: Colors.white,
  Filter.white: Colors.white,
  Filter.red: Colors.red,
  Filter.orange: Colors.orange,
  Filter.yellow: Colors.yellow,
  Filter.green: Colors.green,
  Filter.blue: Colors.blueAccent,
  Filter.pink: Colors.pink,
  Filter.black: Colors.black,
};

Color fiterToColor(Filter filter) {
  return colors[filter];
}
