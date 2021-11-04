class NextEpisodeModel {
  NextEpisodeModel({
    this.href,
  });

  String? href;

  factory NextEpisodeModel.fromJson(Map<String, dynamic> json) =>
      NextEpisodeModel(
        href: json["href"],
      );
}
