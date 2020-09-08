class Photo {
  final int id;
  final String previewURL;
  final String largeImageURL;

  const Photo({this.id, this.previewURL, this.largeImageURL});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      previewURL: json['previewURL'],
      largeImageURL: json['largeImageURL'],
    );
  }

  @override
  String toString() {
    return '{"id": $id, "previewURL": "$previewURL", "largeImageURL": "$largeImageURL"}';
  }
}
