import 'dart:convert';

class GetXpResponseModel {
  GetXpResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetXpResponseModel.fromRawJson(String str) =>
      GetXpResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetXpResponseModel.fromJson(Map<String, dynamic> json) =>
      GetXpResponseModel(
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
    this.jmlXp,
  });

  String? jmlXp;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jmlXp: json["jml_xp"],
      );

  Map<String, dynamic> toJson() => {
        "jml_xp": jmlXp,
      };
}
