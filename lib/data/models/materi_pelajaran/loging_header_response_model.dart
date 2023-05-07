import 'dart:convert';

class LogingHeaderResponseModel {
  LogingHeaderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory LogingHeaderResponseModel.fromRawJson(String str) =>
      LogingHeaderResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogingHeaderResponseModel.fromJson(Map<String, dynamic> json) =>
      LogingHeaderResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.idLogMateriHeader,
    this.userId,
    this.idLevel,
    this.idGroupMateri,
    this.createdDate,
    this.status,
  });

  String? idLogMateriHeader;
  String? userId;
  String? idLevel;
  String? idGroupMateri;
  DateTime? createdDate;
  String? status;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLogMateriHeader: json["id_log_materi_header"],
        userId: json["user_id"],
        idLevel: json["id_level"],
        idGroupMateri: json["id_group_materi"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_log_materi_header": idLogMateriHeader,
        "user_id": userId,
        "id_level": idLevel,
        "id_group_materi": idGroupMateri,
        "created_date": createdDate?.toIso8601String(),
        "status": status,
      };
}
