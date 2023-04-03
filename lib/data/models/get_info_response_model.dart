import 'dart:convert';

class GetInfoResponseModel {
  GetInfoResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetInfoResponseModel.fromRawJson(String str) =>
      GetInfoResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      GetInfoResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.idInfo,
    this.title,
    this.content,
    this.imgFile,
    this.imgUrl,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  String? idInfo;
  String? title;
  String? content;
  String? imgFile;
  String? imgUrl;
  String? createdBy;
  DateTime? createdDate;
  String? updatedBy;
  DateTime? updatedDate;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idInfo: json["id_info"],
        title: json["title"],
        content: json["content"],
        imgFile: json["img_file"],
        imgUrl: json["img_url"],
        createdBy: json["created_by"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        updatedBy: json["updated_by"],
        updatedDate: json["updated_date"] == null
            ? null
            : DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id_info": idInfo,
        "title": title,
        "content": content,
        "img_file": imgFile,
        "img_url": imgUrl,
        "created_by": createdBy,
        "created_date": createdDate?.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
