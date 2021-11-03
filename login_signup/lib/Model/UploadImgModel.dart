// To parse this JSON data, do
//
//     final notiModel = notiModelFromJson(jsonString);

import 'dart:convert';

NotiModel notiModelFromJson(String str) => NotiModel.fromJson(json.decode(str));

String notiModelToJson(NotiModel data) => json.encode(data.toJson());

class NotiModel {
    NotiModel({
        this.no,
        this.image,
        this.message,
        this.name,
        this.status,
    });

    String no;
    String image;
    String message;
    String name;
    String status;

    factory NotiModel.fromJson(Map<String, dynamic> json) => NotiModel(
        no: json["No"],
        image: json["image"],
        message: json["message"],
        name: json["name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "No": no,
        "image": image,
        "message": message,
        "name": name,
        "status": status,
    };
}


class ResumeModel {
  String link;
  ResumeModel({this.link});
  factory ResumeModel.fromJson(Map<String, dynamic> json) => ResumeModel(
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toJson() => {
        "link": link == null ? null : link,
      };
}

NotiPackageModel notiPackageModelFromJson(String str) => NotiPackageModel.fromJson(json.decode(str));

String notiPackageModelToJson(NotiPackageModel data) => json.encode(data.toJson());

class NotiPackageModel {
    NotiPackageModel({
        this.id,
        this.no,
        this.image,
        this.message,
        this.name,
        this.status,
    });

    String id;
    String no;
    String image;
    String message;
    String name;
    bool status;

    factory NotiPackageModel.fromJson(Map<String, dynamic> json) => NotiPackageModel(
        id: json["id"],
        no: json["No"],
        image: json["image"],
        message: json["message"],
        name: json["name"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "No": no,
        "image": image,
        "message": message,
        "name": name,
        "status": status,
    };
}
