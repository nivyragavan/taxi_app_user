// To parse this JSON data, do
//
//     final getAllTripListModel = getAllTripListModelFromJson(jsonString);

import 'dart:convert';

GetAllTripListModel getAllTripListModelFromJson(String str) =>
    GetAllTripListModel.fromJson(json.decode(str));

String getAllTripListModelToJson(GetAllTripListModel data) =>
    json.encode(data.toJson());

class GetAllTripListModel {
  GetAllTripListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory GetAllTripListModel.fromJson(Map<String, dynamic> json) =>
      GetAllTripListModel(
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
    this.userId,
    this.alluserTripusers,
  });

  String? userId;
  List<dynamic>? alluserTripusers;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        userId: json["userId"],
        alluserTripusers:
            List<dynamic>.from(json["AlluserTripusers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "AlluserTripusers": List<dynamic>.from(alluserTripusers!.map((x) => x)),
      };
}
