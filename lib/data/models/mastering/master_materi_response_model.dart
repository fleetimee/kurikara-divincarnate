import 'dart:convert';

class MasterMateriResponseModel {
  MasterMateriResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<MasterMateri>? data;

  factory MasterMateriResponseModel.fromRawJson(String str) =>
      MasterMateriResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterMateriResponseModel.fromJson(Map<String, dynamic> json) =>
      MasterMateriResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MasterMateri>.from(
                json["data"]!.map((x) => MasterMateri.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MasterMateri {
  MasterMateri({
    this.idMateri,
    this.idLevel,
    this.idLesson,
    this.idGroupMateri,
    this.urutan,
    this.latihanUrlFile,
    this.latihanTitle,
    this.latihanImage,
    this.latihanVoice,
    this.latihanCina,
    this.latihanIndonesia,
    this.latihanVoice2,
    this.latihanCina2,
    this.latihanIndonesia2,
    this.materiCreateBy,
    this.materiCreateDate,
    this.materiUpdateBy,
    this.materiUpdateDate,
    this.materiIsDelete,
  });

  String? idMateri;
  String? idLevel;
  String? idLesson;
  String? idGroupMateri;
  String? urutan;
  String? latihanUrlFile;
  String? latihanTitle;
  String? latihanImage;
  String? latihanVoice;
  String? latihanCina;
  String? latihanIndonesia;
  String? latihanVoice2;
  String? latihanCina2;
  String? latihanIndonesia2;
  String? materiCreateBy;
  DateTime? materiCreateDate;
  String? materiUpdateBy;
  DateTime? materiUpdateDate;
  String? materiIsDelete;

  factory MasterMateri.fromRawJson(String str) =>
      MasterMateri.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterMateri.fromJson(Map<String, dynamic> json) => MasterMateri(
        idMateri: json["id_materi"],
        idLevel: json["id_level"],
        idLesson: json["id_lesson"],
        idGroupMateri: json["id_group_materi"],
        urutan: json["urutan"],
        latihanUrlFile: json["latihan_url_file"],
        latihanTitle: json["latihan_title"],
        latihanImage: json["latihan_image"],
        latihanVoice: json["latihan_voice"],
        latihanCina: json["latihan_cina"],
        latihanIndonesia: json["latihan_indonesia"],
        latihanVoice2: json["latihan_voice_2"],
        latihanCina2: json["latihan_cina_2"],
        latihanIndonesia2: json["latihan_indonesia_2"],
        materiCreateBy: json["materi_create_by"],
        materiCreateDate: json["materi_create_date"] == null
            ? null
            : DateTime.parse(json["materi_create_date"]),
        materiUpdateBy: json["materi_update_by"],
        materiUpdateDate: json["materi_update_date"] == null
            ? null
            : DateTime.parse(json["materi_update_date"]),
        materiIsDelete: json["materi_is_delete"],
      );

  Map<String, dynamic> toJson() => {
        "id_materi": idMateri,
        "id_level": idLevel,
        "id_group_materi": idGroupMateri,
        "urutan": urutan,
        "latihan_url_file": latihanUrlFile,
        "latihan_title": latihanTitle,
        "latihan_image": latihanImage,
        "latihan _voice": latihanVoice,
        "latihan_cina": latihanCina,
        "latihan_indonesia": latihanIndonesia,
        "materi_create_by": materiCreateBy,
        "materi_create_date": materiCreateDate?.toIso8601String(),
        "materi_update_by": materiUpdateBy,
        "materi_update_date": materiUpdateDate?.toIso8601String(),
        "materi_is_delete": materiIsDelete,
      };
}
