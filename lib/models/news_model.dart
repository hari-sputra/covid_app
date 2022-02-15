// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

List<News> newsFromJson(String str) =>
    List<News>.from(json.decode(str).map((x) => News.fromJson(x)));

String newsToJson(List<News> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class News {
  News({
   required this.title,
  required  this.url,
    this.timestamp,
  });

  String title;
  String url;
  int? timestamp;

  factory News.fromJson(Map<String, dynamic> json) => News(
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
