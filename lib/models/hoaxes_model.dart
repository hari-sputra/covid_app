// To parse this JSON data, do
//
//     final hoaxes = hoaxesFromJson(jsonString);

import 'dart:convert';

List<Hoaxes> hoaxesFromJson(String str) =>
    List<Hoaxes>.from(json.decode(str).map((x) => Hoaxes.fromJson(x)));

String hoaxesToJson(List<Hoaxes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hoaxes {
  Hoaxes({
  required  this.title,
  required  this.url,
  required  this.timestamp,
  });

  String title;
  String url;
  int timestamp;

  factory Hoaxes.fromJson(Map<String, dynamic> json) => Hoaxes(
        title: json["title"],
        url: json["url"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "timestamp": timestamp,
      };
}
