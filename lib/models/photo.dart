class Photo {
  final int id;
  final String previewUrl;
  final String imageURL;

  const Photo({this.id, this.previewUrl, this.imageURL});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      previewUrl: json['previewURL'],
      imageURL: json['imageURL'],
    );
  }
}
