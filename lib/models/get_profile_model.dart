// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  GetProfileModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "body": body!.toJson(),
  };
}

class Body {
  Body({
    this.id,
    this.name,
    this.email,
    this.location,
    this.contact,
  });

  int? id;
  String? name;
  String? email;
  dynamic location;
  String? contact;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    location: json["location"],
    contact: json["contact"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "location": location,
    "contact": contact,
  };
}
