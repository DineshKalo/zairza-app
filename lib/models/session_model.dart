import 'dart:convert';

import 'dart:convert';

class Session {
  final String id;
  final String name;
  final String url;
  final int v;

  Session({
    required this.id,
    required this.name,
    required this.url,
    required this.v,
  });

  factory Session.fromRawJson(String str) => Session.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Session.fromJson(Map<String, dynamic> json) => Session(
    id: json["_id"] ?? "",
    name: json["name"] ?? "Unknown",
    url: json["url"] ?? "No URL",
    v: json["__v"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "url": url,
    "__v": v,
  };
}
