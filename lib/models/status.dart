// To parse this JSON data, do
//
//     final statusCovid = statusCovidFromJson(jsonString);

import 'dart:convert';

StatusCovid statusCovidFromJson(String str) =>
    StatusCovid.fromJson(json.decode(str));

String statusCovidToJson(StatusCovid data) => json.encode(data.toJson());

class StatusCovid {
  StatusCovid({
    required this.type,
    required this.name,
    required this.timestamp,
    required this.numbers,
    required this.regions,
  });

  String type;
  String name;
  int timestamp;
  Numbers numbers;
  List<Region> regions;

  factory StatusCovid.fromJson(Map<String, dynamic> json) => StatusCovid(
        type: json["type"],
        name: json["name"],
        timestamp: json["timestamp"],
        numbers: Numbers.fromJson(json["numbers"]),
        regions:
            List<Region>.from(json["regions"].map((x) => Region.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "name": name,
        "timestamp": timestamp,
        "numbers": numbers.toJson(),
        "regions": List<dynamic>.from(regions.map((x) => x.toJson())),
      };
}

class Numbers {
  Numbers({
    required this.infected,
    required this.recovered,
    required this.fatal,
  });

  int infected;
  int recovered;
  int fatal;

  factory Numbers.fromJson(Map<String, dynamic> json) => Numbers(
        infected: json["infected"],
        recovered: json["recovered"],
        fatal: json["fatal"],
      );

  Map<String, dynamic> toJson() => {
        "infected": infected,
        "recovered": recovered,
        "fatal": fatal,
      };
}

class Region {
  Region({
    this.type,
    required this.name,
     this.numbers,
  });

  Type? type;
  String name;
  Numbers? numbers;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        type: typeValues.map[json["type"]],
        name: json["name"],
        numbers: Numbers.fromJson(json["numbers"]),
      );

  Map<String, dynamic> toJson() => {
        "type": typeValues.reverse[type],
        "name": name,
        "numbers": numbers!.toJson(),
      };
}

enum Type { PROVINCE }

final typeValues = EnumValues({"province": Type.PROVINCE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
