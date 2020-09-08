enum Filter {
  none,
  white,
  red,
  orange,
  yellow,
  green,
  blue,
  pink,
  black,
}

extension ParseToString on Filter {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
