import 'dart:convert';

class LatihanHeaderResponseModel {
  LatihanHeaderResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory LatihanHeaderResponseModel.fromRawJson(String str) =>
      LatihanHeaderResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LatihanHeaderResponseModel.fromJson(Map<String, dynamic> json) =>
      LatihanHeaderResponseModel(
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
    this.idLogSoalHeader,
    this.userId,
    this.idLevel,
    this.idGroupMateri,
    this.createdDate,
    this.status,
    this.idLesson,
  });

  int? idLogSoalHeader;
  String? userId;
  String? idLevel;
  String? idGroupMateri;
  DateTime? createdDate;
  String? status;
  String? idLesson;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLogSoalHeader: json["id_log_soal_header"],
        userId: json["user_id"],
        idLevel: json["id_level"],
        idGroupMateri: json["id_group_materi"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        status: json["status"],
        idLesson: json["id_lesson"],
      );

  Map<String, dynamic> toJson() => {
        "id_log_soal_header": idLogSoalHeader,
        "user_id": userId,
        "id_level": idLevel,
        "id_group_materi": idGroupMateri,
        "created_date": createdDate?.toIso8601String(),
        "status": status,
      };
}
