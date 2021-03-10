// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
    this.name,
    this.age,
    this.height,
    this.gender,
    this.hairColor,
  });

  String name;
  String age;
  String height;
  String gender;
  String hairColor;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        age: json["age"],
        height: json["height"] == null ? null : json["height"],
        gender: json["gender"],
        hairColor: json["hair_color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "height": height == null ? null : height,
        "gender": gender,
        "hair_color": hairColor,
      };
}
