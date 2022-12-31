// To parse this JSON data, do
//
//     final getUpcomingListModel = getUpcomingListModelFromJson(jsonString);

import 'dart:convert';

GetUpcomingListModel getUpcomingListModelFromJson(String str) =>
    GetUpcomingListModel.fromJson(json.decode(str));

String getUpcomingListModelToJson(GetUpcomingListModel data) =>
    json.encode(data.toJson());

class GetUpcomingListModel {
  GetUpcomingListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory GetUpcomingListModel.fromJson(Map<String, dynamic> json) =>
      GetUpcomingListModel(
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
    this.upcomimgTrip,
  });

  String? userId;
  List<dynamic>? upcomimgTrip;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        userId: json["userId"],
        upcomimgTrip: List<dynamic>.from(json["upcomimgTrip"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "upcomimgTrip": List<dynamic>.from(upcomimgTrip!.map((x) => x)),
      };
}
