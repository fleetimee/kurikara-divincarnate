// ignore_for_file: constant_identifier_names

import 'dart:convert';

class MasterGroupMateriResponseModel {
  MasterGroupMateriResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory MasterGroupMateriResponseModel.fromRawJson(String str) =>
      MasterGroupMateriResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterGroupMateriResponseModel.fromJson(Map<String, dynamic> json) =>
      MasterGroupMateriResponseModel(
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
    this.idGroupMateri,
    this.idLevel,
    this.name,
    this.imgFile,
    this.imgUrl,
    this.groupMateriCreateBy,
    this.groupMateriCreateDate,
    this.groupMateriUpdateBy,
    this.groupMateriUpdateDate,
    this.groupMateriIsDelete,
    this.reportReading,
    this.reportSpeaking,
  });

  String? idGroupMateri;
  String? idLevel;
  String? name;
  String? imgFile;
  String? imgUrl;
  String? groupMateriCreateBy;
  DateTime? groupMateriCreateDate;
  String? groupMateriUpdateBy;
  DateTime? groupMateriUpdateDate;
  String? groupMateriIsDelete;
  List<ReportIng>? reportReading;
  List<ReportIng>? reportSpeaking;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        idGroupMateri: json["id_group_materi"],
        idLevel: json["id_level"],
        name: json["name"],
        imgFile: json["img_file"],
        imgUrl: json["img_url"],
        groupMateriCreateBy: json["group_materi_create_by"],
        groupMateriCreateDate: json["group_materi_create_date"] == null
            ? null
            : DateTime.parse(json["group_materi_create_date"]),
        groupMateriUpdateBy: json["group_materi_update_by"],
        groupMateriUpdateDate: json["group_materi_update_date"] == null
            ? null
            : DateTime.parse(json["group_materi_update_date"]),
        groupMateriIsDelete: json["group_materi_is_delete"],
        reportReading: json["report_reading"] == null
            ? []
            : List<ReportIng>.from(
                json["report_reading"]!.map((x) => ReportIng.fromJson(x))),
        reportSpeaking: json["report_speaking"] == null
            ? []
            : List<ReportIng>.from(
                json["report_speaking"]!.map((x) => ReportIng.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_group_materi": idGroupMateri,
        "id_level": idLevel,
        "name": name,
        "img_file": imgFile,
        "img_url": imgUrl,
        "group_materi_create_by": groupMateriCreateBy,
        "group_materi_create_date": groupMateriCreateDate?.toIso8601String(),
        "group_materi_update_by": groupMateriUpdateBy,
        "group_materi_update_date": groupMateriUpdateDate?.toIso8601String(),
        "group_materi_is_delete": groupMateriIsDelete,
        "report_reading": reportReading == null
            ? []
            : List<dynamic>.from(reportReading!.map((x) => x.toJson())),
        "report_speaking": reportSpeaking == null
            ? []
            : List<dynamic>.from(reportSpeaking!.map((x) => x.toJson())),
      };
}

class ReportIng {
  ReportIng({
    this.idLevel,
    this.levelName,
    this.userId,
    this.jawabanBenar,
    this.jmlSoal,
    this.nilai,
  });

  String? idLevel;
  LevelName? levelName;
  String? userId;
  String? jawabanBenar;
  String? jmlSoal;
  String? nilai;

  factory ReportIng.fromRawJson(String str) =>
      ReportIng.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReportIng.fromJson(Map<String, dynamic> json) => ReportIng(
        idLevel: json["id_level"],
        levelName: levelNameValues.map[json["level_name"]]!,
        userId: json["user_id"],
        jawabanBenar: json["jawaban_benar"],
        jmlSoal: json["jml_soal"],
        nilai: json["nilai"],
      );

  Map<String, dynamic> toJson() => {
        "id_level": idLevel,
        "level_name": levelNameValues.reverse[levelName],
        "user_id": userId,
        "jawaban_benar": jawabanBenar,
        "jml_soal": jmlSoal,
        "nilai": nilai,
      };
}

enum LevelName { THE_1_A }

final levelNameValues = EnumValues({"1A": LevelName.THE_1_A});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
