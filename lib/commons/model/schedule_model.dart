class ScheduleModel {
  ScheduleModel({
    this.time,
    this.days,
  });

  String? time;
  List<String>? days;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        time: json["time"],
        days: json["days"] == null ? null : List<String>.from(json["days"]),
      );
}
