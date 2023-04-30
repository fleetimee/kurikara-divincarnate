import 'dart:convert';

class MasterSoalResponseModel {
  MasterSoalResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<MasterSoal>? data;

  factory MasterSoalResponseModel.fromRawJson(String str) =>
      MasterSoalResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterSoalResponseModel.fromJson(Map<String, dynamic> json) =>
      MasterSoalResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MasterSoal>.from(
                json["data"]!.map((x) => MasterSoal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MasterSoal {
  MasterSoal({
    this.idSoal,
    this.idLevel,
    this.idLesson,
    this.idGroupMateri,
    this.tipe,
    this.soalTitle,
    this.soalImage,
    this.soalVoice,
    this.fileUrl,
    this.pgJawabanA,
    this.pgJawabanB,
    this.pgJawabanC,
    this.pgJawabanD,
    this.pgResult,
    this.cocokSoal1,
    this.cocokSoal2,
    this.cocokSoal3,
    this.cocokSoal4,
    this.cocokSoal5,
    this.cocokJawabA,
    this.cocokJawabB,
    this.cocokJawabC,
    this.cocokJawabD,
    this.cocokJawabE,
    this.cocokResult,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  String? idSoal;
  String? idLevel;
  String? idLesson;
  String? idGroupMateri;
  String? tipe;
  String? soalTitle;
  dynamic soalImage;
  dynamic soalVoice;
  String? fileUrl;
  String? pgJawabanA;
  String? pgJawabanB;
  String? pgJawabanC;
  String? pgJawabanD;
  String? pgResult;
  String? cocokSoal1;
  String? cocokSoal2;
  String? cocokSoal3;
  String? cocokSoal4;
  String? cocokSoal5;
  String? cocokJawabA;
  String? cocokJawabB;
  String? cocokJawabC;
  String? cocokJawabD;
  String? cocokJawabE;
  String? cocokResult;
  String? createdBy;
  DateTime? createdDate;
  String? updatedBy;
  DateTime? updatedDate;

  factory MasterSoal.fromRawJson(String str) =>
      MasterSoal.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterSoal.fromJson(Map<String, dynamic> json) => MasterSoal(
        idSoal: json["id_soal"],
        idLevel: json["id_level"],
        idLesson: json["id_lesson"],
        idGroupMateri: json["id_group_materi"],
        tipe: json["tipe"],
        soalTitle: json["soal_title"],
        soalImage: json["soal_image"],
        soalVoice: json["soal_voice"],
        fileUrl: json["file_url"],
        pgJawabanA: json["pg_jawaban_a"],
        pgJawabanB: json["pg_jawaban_b"],
        pgJawabanC: json["pg_jawaban_c"],
        pgJawabanD: json["pg_jawaban_d"],
        pgResult: json["pg_result"],
        cocokSoal1: json["cocok_soal_1"],
        cocokSoal2: json["cocok_soal_2"],
        cocokSoal3: json["cocok_soal_3"],
        cocokSoal4: json["cocok_soal_4"],
        cocokSoal5: json["cocok_soal_5"],
        cocokJawabA: json["cocok_jawab_a"],
        cocokJawabB: json["cocok_jawab_b"],
        cocokJawabC: json["cocok_jawab_c"],
        cocokJawabD: json["cocok_jawab_d"],
        cocokJawabE: json["cocok_jawab_e"],
        cocokResult: json["cocok_result"],
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
        "id_soal": idSoal,
        "id_level": idLevel,
        "id_group_materi": idGroupMateri,
        "tipe": tipe,
        "soal_title": soalTitle,
        "soal_image": soalImage,
        "soal_voice": soalVoice,
        "file_url": fileUrl,
        "pg_jawaban_a": pgJawabanA,
        "pg_jawaban_b": pgJawabanB,
        "pg_jawaban_c": pgJawabanC,
        "pg_jawaban_d": pgJawabanD,
        "pg_result": pgResult,
        "cocok_soal_1": cocokSoal1,
        "cocok_soal_2": cocokSoal2,
        "cocok_soal_3": cocokSoal3,
        "cocok_soal_4": cocokSoal4,
        "cocok_soal_5": cocokSoal5,
        "cocok_jawab_a": cocokJawabA,
        "cocok_jawab_b": cocokJawabB,
        "cocok_jawab_c": cocokJawabC,
        "cocok_jawab_d": cocokJawabD,
        "cocok_jawab_e": cocokJawabE,
        "cocok_result": cocokResult,
        "created_by": createdBy,
        "created_date": createdDate?.toIso8601String(),
        "updated_by": updatedBy,
        "updated_date": updatedDate?.toIso8601String(),
      };
}
