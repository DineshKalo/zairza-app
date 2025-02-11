import 'dart:convert';

class Roadmap {
  final String id;
  final String name;
  final String links;
  final int v;

  Roadmap({
    required this.id,
    required this.name,
    required this.links,
    required this.v,
  });

  factory Roadmap.fromRawJson(String str) => Roadmap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Roadmap.fromJson(Map<String, dynamic> json) => Roadmap(
    id: json["_id"] as String,
    name: json["name"] as String,
    links: json["links"] as String,
    v: json["__v"] as int,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "links": links,
    "__v": v,
  };
}
