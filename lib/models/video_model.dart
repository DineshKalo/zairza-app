import 'dart:convert';

class Video {
  String id;
  String name;
  String description;
  String url;
  int? v;

  Video({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    this.v,
  });

  factory Video.fromRawJson(String str) => Video.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "url": url,
    "__v": v,
  };
}
