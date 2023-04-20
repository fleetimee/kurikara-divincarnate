
import 'dart:convert';

class MasterLessonResponseModel {
  MasterLessonResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Lesson>? data;

  factory MasterLessonResponseModel.fromRawJson(String str) =>
      MasterLessonResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MasterLessonResponseModel.fromJson(Map<String, dynamic> json) =>
      MasterLessonResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Lesson>.from(json["data"]!.map((x) => Lesson.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Lesson {
  Lesson({
    this.idLesson,
    this.idLevel,
    this.name,
    this.imgFile,
    this.imgUrl,
    this.lessonCreateBy,
    this.lessonCreateDate,
    this.lessonUpdateBy,
    this.lessonUpdateDate,
    this.lessonIsDelete,
    this.reportReading,
    this.reportSpeaking,
    this.sisaSession,
    this.open,
  });

  String? idLesson;
  String? idLevel;
  String? name;
  String? imgFile;
  String? imgUrl;
  String? lessonCreateBy;
  DateTime? lessonCreateDate;
  String? lessonUpdateBy;
  DateTime? lessonUpdateDate;
  String? lessonIsDelete;
  List<dynamic>? reportReading;
  List<dynamic>? reportSpeaking;
  String? sisaSession;
  bool? open;

  factory Lesson.fromRawJson(String str) => Lesson.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        idLesson: json["id_lesson"],
        idLevel: json["id_level"],
        name: json["name"],
        imgFile: json["img_file"],
        imgUrl: json["img_url"],
        lessonCreateBy: json["lesson_create_by"],
        lessonCreateDate: json["lesson_create_date"] == null
            ? null
            : DateTime.parse(json["lesson_create_date"]),
        lessonUpdateBy: json["lesson_update_by"],
        lessonUpdateDate: json["lesson_update_date"] == null
            ? null
            : DateTime.parse(json["lesson_update_date"]),
        lessonIsDelete: json["lesson_is_delete"],
        reportReading: json["report_reading"] == null
            ? []
            : List<dynamic>.from(json["report_reading"]!.map((x) => x)),
        reportSpeaking: json["report_speaking"] == null
            ? []
            : List<dynamic>.from(json["report_speaking"]!.map((x) => x)),
        sisaSession: json["sisa_session"],
        open: json["open"],
      );

  Map<String, dynamic> toJson() => {
        "id_lesson": idLesson,
        "id_level": idLevel,
        "name": name,
        "img_file": imgFile,
        "img_url": imgUrl,
        "lesson_create_by": lessonCreateBy,
        "lesson_create_date": lessonCreateDate?.toIso8601String(),
        "lesson_update_by": lessonUpdateBy,
        "lesson_update_date": lessonUpdateDate?.toIso8601String(),
        "lesson_is_delete": lessonIsDelete,
        "report_reading": reportReading == null
            ? []
            : List<dynamic>.from(reportReading!.map((x) => x)),
        "report_speaking": reportSpeaking == null
            ? []
            : List<dynamic>.from(reportSpeaking!.map((x) => x)),
        "sisa_session": sisaSession,
        "open": open,
      };
}
