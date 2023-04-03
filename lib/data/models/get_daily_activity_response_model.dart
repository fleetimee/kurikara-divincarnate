import 'dart:convert';

class GetDailyActivityResponseModel {
  GetDailyActivityResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory GetDailyActivityResponseModel.fromRawJson(String str) =>
      GetDailyActivityResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetDailyActivityResponseModel.fromJson(Map<String, dynamic> json) =>
      GetDailyActivityResponseModel(
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
    this.jmlDaily,
  });

  String? jmlDaily;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        jmlDaily: json["jml_daily"],
      );

  Map<String, dynamic> toJson() => {
        "jml_daily": jmlDaily,
      };
}
