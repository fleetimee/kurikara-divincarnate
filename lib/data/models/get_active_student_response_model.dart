import 'dart:convert';

class GetActiveStudentResponseModel {
  GetActiveStudentResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetActiveStudentResponseModel.fromRawJson(String str) =>
      GetActiveStudentResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetActiveStudentResponseModel.fromJson(Map<String, dynamic> json) =>
      GetActiveStudentResponseModel(
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
    this.jmlAktivitas,
    this.fullName,
    this.imgFile,
    this.imgUrl,
    this.noTelpon,
    this.email,
    this.dateLog,
  });

  String? jmlAktivitas;
  String? fullName;
  String? imgFile;
  String? imgUrl;
  String? noTelpon;
  String? email;
  DateTime? dateLog;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jmlAktivitas: json["jml_aktivitas"],
        fullName: json["full_name"],
        imgFile: json["img_file"],
        imgUrl: json["img_url"],
        noTelpon: json["no_telpon"],
        email: json["email"],
        dateLog:
            json["date_log"] == null ? null : DateTime.parse(json["date_log"]),
      );

  Map<String, dynamic> toJson() => {
        "jml_aktivitas": jmlAktivitas,
        "full_name": fullName,
        "img_file": imgFile,
        "img_url": imgUrl,
        "no_telpon": noTelpon,
        "email": email,
        "date_log":
            "${dateLog!.year.toString().padLeft(4, '0')}-${dateLog!.month.toString().padLeft(2, '0')}-${dateLog!.day.toString().padLeft(2, '0')}",
      };
}
