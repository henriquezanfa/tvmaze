class RatingModel {
  RatingModel({
    this.average,
  });

  double? average;

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        average: json["average"] == null ? null : json["average"].toDouble(),
      );
}
