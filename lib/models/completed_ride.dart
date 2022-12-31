// To parse this JSON data, do
//
//     final completedRideListModel = completedRideListModelFromJson(jsonString);

import 'dart:convert';

CompletedRideListModel completedRideListModelFromJson(String str) =>
    CompletedRideListModel.fromJson(json.decode(str));

String completedRideListModelToJson(CompletedRideListModel data) =>
    json.encode(data.toJson());

class CompletedRideListModel {
  CompletedRideListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory CompletedRideListModel.fromJson(Map<String, dynamic> json) =>
      CompletedRideListModel(
        statusCode: json["statusCode"],
        code: json["code"],
        message: json["message"],
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "code": code,
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  Body({
    this.userId,
    this.completedList,
  });

  String? userId;
  List<dynamic>? completedList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        userId: json["userId"],
        completedList: List<dynamic>.from(json["completedList"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "completedList": List<dynamic>.from(completedList!.map((x) => x)),
      };
}
