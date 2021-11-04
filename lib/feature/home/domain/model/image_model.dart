class ImageModel {
  ImageModel({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        medium: json["medium"],
        original: json["original"],
      );
}
