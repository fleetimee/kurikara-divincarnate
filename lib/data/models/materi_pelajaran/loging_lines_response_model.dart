import 'dart:convert';

class LogingLinesResponseModel {
  LogingLinesResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory LogingLinesResponseModel.fromRawJson(String str) =>
      LogingLinesResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogingLinesResponseModel.fromJson(Map<String, dynamic> json) =>
      LogingLinesResponseModel(
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
    this.idLogMateriLines,
    this.idLogMateriHeader,
    this.idMateri,
    this.createdDate,
    this.voiceTry,
  });

  String? idLogMateriLines;
  String? idLogMateriHeader;
  String? idMateri;
  DateTime? createdDate;
  String? voiceTry;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        idLogMateriLines: json["id_log_materi_lines"],
        idLogMateriHeader: json["id_log_materi_header"],
        idMateri: json["id_materi"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
        voiceTry: json["voice_try"],
      );

  Map<String, dynamic> toJson() => {
        "id_log_materi_lines": idLogMateriLines,
        "id_log_materi_header": idLogMateriHeader,
        "id_materi": idMateri,
        "created_date": createdDate?.toIso8601String(),
        "voice_try": voiceTry,
      };
}
