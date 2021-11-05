import 'package:tvmaze/commons/model/next_episode_model.dart';

class LinksModel {
  LinksModel({
    this.self,
    this.previousEpisode,
    this.nextEpisode,
  });

  NextEpisodeModel? self;
  NextEpisodeModel? previousEpisode;
  NextEpisodeModel? nextEpisode;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        self: json["self"] == null
            ? null
            : NextEpisodeModel.fromJson(json["self"]),
        previousEpisode: json["previousepisode"] == null
            ? null
            : NextEpisodeModel.fromJson(json["previousepisode"]),
        nextEpisode: json["nextepisode"] == null
            ? null
            : NextEpisodeModel.fromJson(json["nextepisode"]),
      );
}
