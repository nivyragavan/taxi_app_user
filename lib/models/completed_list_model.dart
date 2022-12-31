// To parse this JSON data, do
//
//     final getCompletedListModel = getCompletedListModelFromJson(jsonString);

import 'dart:convert';

GetCompletedListModel getCompletedListModelFromJson(String str) =>
    GetCompletedListModel.fromJson(json.decode(str));

String getCompletedListModelToJson(GetCompletedListModel data) =>
    json.encode(data.toJson());

class GetCompletedListModel {
  GetCompletedListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory GetCompletedListModel.fromJson(Map<String, dynamic> json) =>
      GetCompletedListModel(
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
