import 'dart:convert';

class Event {
  final String id;
  final String title;
  final DateTime dateAndTime;
  final String wing;
  final String eventImg;
  final String description;
  final String seniorIncharge;
  final int? v;

  Event({
    required this.id,
    required this.title,
    required this.dateAndTime,
    required this.wing,
    required this.eventImg,
    required this.description,
    required this.seniorIncharge,
    this.v,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["_id"],
    title: json["title"],
    dateAndTime: DateTime.parse(json["date_and_time"]),
    wing: json["wing"],
    eventImg: json["event_img"],
    description: json["description"],
    seniorIncharge: json["senior_incharge"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "date_and_time": dateAndTime.toIso8601String(),
    "wing": wing,
    "event_img": eventImg,
    "description": description,
    "senior_incharge": seniorIncharge,
    "__v": v,
  };
}
