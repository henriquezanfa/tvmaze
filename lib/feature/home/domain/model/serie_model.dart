import 'dart:convert';

import 'package:tvmaze/feature/home/domain/model/image_model.dart';
import 'package:tvmaze/feature/home/domain/model/links_model.dart';
import 'package:tvmaze/feature/home/domain/model/rating_model.dart';
import 'package:tvmaze/feature/home/domain/model/schedule_model.dart';

List<SerieModel> serieModelFromJson(String str) =>
    List<SerieModel>.from(json.decode(str).map((x) => SerieModel.fromJson(x)));

class SerieModel {
  SerieModel({
    required this.id,
    required this.url,
    required this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.image,
    this.summary,
    this.links,
  });

  int id;
  String url;
  String name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  ScheduleModel? schedule;
  RatingModel? rating;
  int? weight;
  ImageModel? image;
  String? summary;
  LinksModel? links;

  factory SerieModel.fromJson(Map<String, dynamic> json) => SerieModel(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"] == null ? null : json["type"],
        language: json["language"] == null ? null : json["language"],
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        status: json["status"] == null ? null : json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: json["schedule"] == null
            ? null
            : ScheduleModel.fromJson(json["schedule"]),
        rating: json["rating"] == null
            ? null
            : RatingModel.fromJson(json["rating"]),
        weight: json["weight"],
        image:
            json["image"] == null ? null : ImageModel.fromJson(json["image"]),
        summary: json["summary"],
        links:
            json["_links"] == null ? null : LinksModel.fromJson(json["_links"]),
      );
}
