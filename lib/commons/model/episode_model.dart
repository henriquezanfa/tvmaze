import 'package:tvmaze/commons/model/image_model.dart';
import 'package:tvmaze/commons/model/links_model.dart';
import 'package:tvmaze/commons/model/rating_model.dart';

class EpisodeModel {
  EpisodeModel({
    this.id,
    this.url,
    this.name,
    this.season,
    this.number,
    this.type,
    this.airdate,
    this.airtime,
    this.airstamp,
    this.runtime,
    this.rating,
    this.image,
    this.summary,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  int? season;
  int? number;
  String? type;
  DateTime? airdate;
  String? airtime;
  DateTime? airstamp;
  int? runtime;
  RatingModel? rating;
  ImageModel? image;
  String? summary;
  LinksModel? links;

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        season: json["season"] == null ? null : json["season"],
        number: json["number"] == null ? null : json["number"],
        type: json["type"] == null ? null : json["type"],
        airdate:
            json["airdate"] == null ? null : DateTime.parse(json["airdate"]),
        airtime: json["airtime"] == null ? null : json["airtime"],
        airstamp:
            json["airstamp"] == null ? null : DateTime.parse(json["airstamp"]),
        runtime: json["runtime"] == null ? null : json["runtime"],
        rating: json["rating"] == null
            ? null
            : RatingModel.fromJson(json["rating"]),
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        summary: json["summary"] == null ? null : json["summary"],
        links:
            json["_links"] == null ? null : LinksModel.fromJson(json["_links"]),
      );
}
