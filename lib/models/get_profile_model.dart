// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

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

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
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
    this.userData,
  });

  String? userId;
  UserData? userData;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        userId: json["userId"],
        userData: UserData.fromJson(json["userData"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userData": userData!.toJson(),
      };
}

class UserData {
  UserData({
    this.name,
    this.email,
    this.contact,
    this.gender,
    this.dob,
    this.wallet,
    this.userId,
    this.referral,
    this.createdAt,
  });

  String? name;
  String? email;
  String? contact;
  dynamic gender;
  dynamic dob;
  int? wallet;
  String? userId;
  String? referral;
  DateTime? createdAt;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        gender: json["gender"],
        dob: json["dob"],
        wallet: json["wallet"],
        userId: json["user_id"],
        referral: json["referral"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contact": contact,
        "gender": gender,
        "dob": dob,
        "wallet": wallet,
        "user_id": userId,
        "referral": referral,
        "created_at": createdAt!.toIso8601String(),
      };
}
