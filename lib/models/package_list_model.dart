// To parse this JSON data, do
//
//     final packageListModel = packageListModelFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListModelFromJson(String str) => PackageListModel.fromJson(json.decode(str));

String packageListModelToJson(PackageListModel data) => json.encode(data.toJson());

class PackageListModel {
  PackageListModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory PackageListModel.fromJson(Map<String, dynamic> json) => PackageListModel(
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
    this.packageList,
  });

  List<PackageList>? packageList;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    packageList: List<PackageList>.from(json["packageList"].map((x) => PackageList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "packageList": List<dynamic>.from(packageList!.map((x) => x.toJson())),
  };
}

class PackageList {
  PackageList({
    this.id,
    this.packageName,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? packageName;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory PackageList.fromJson(Map<String, dynamic> json) => PackageList(
    id: json["id"],
    packageName: json["package_name"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "package_name": packageName,
    "status": status,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
