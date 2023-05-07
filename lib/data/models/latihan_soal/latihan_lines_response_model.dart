import 'dart:convert';

class LatihanLinesResponseModel {
  LatihanLinesResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory LatihanLinesResponseModel.fromRawJson(String str) =>
      LatihanLinesResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LatihanLinesResponseModel.fromJson(Map<String, dynamic> json) =>
      LatihanLinesResponseModel(
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
    this.idLogSoalLines,
    this.idSoal,
    this.tipe,
    this.pgAnswer,
    this.cocokAnswer,
    this.voiceAnswer,
    this.status,
    this.createdDate,
  });

  String? idLogSoalLines;
  String? idSoal;
  String? tipe;
  String? pgAnswer;
  String? cocokAnswer;
  String? voiceAnswer;
  String? status;
  DateTime? createdDate;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLogSoalLines: json["id_log_soal_lines"],
        idSoal: json["id_soal"],
        tipe: json["tipe"],
        pgAnswer: json["pg_answer"],
        cocokAnswer: json["cocok_answer"],
        voiceAnswer: json["voice_answer"],
        status: json["status"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id_log_soal_lines": idLogSoalLines,
        "id_soal": idSoal,
        "tipe": tipe,
        "pg_answer": pgAnswer,
        "cocok_answer": cocokAnswer,
        "voice_answer": voiceAnswer,
        "status": status,
        "created_date": createdDate?.toIso8601String(),
      };
}
