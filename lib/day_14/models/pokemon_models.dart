// To parse this JSON data, do
//
//     final dataGot = dataGotFromJson(jsonString);

import 'dart:convert';

List<DataGot> dataGotFromJson(String str) =>
    List<DataGot>.from(json.decode(str).map((x) => DataGot.fromJson(x)));

String dataGotToJson(List<DataGot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataGot {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;
  String? title;
  String? family;
  String? image;
  String? imageUrl;

  DataGot({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.title,
    this.family,
    this.image,
    this.imageUrl,
  });

  factory DataGot.fromJson(Map<String, dynamic> json) => DataGot(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    title: json["title"],
    family: json["family"],
    image: json["image"],
    imageUrl: json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "title": title,
    "family": family,
    "image": image,
    "imageUrl": imageUrl,
  };
}
