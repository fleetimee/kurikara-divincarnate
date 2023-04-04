// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class LogingLinesRequestModel {
  final String id_log_materi_header;
  final String id_materi;
  File? voice_try;
  final String user_id;
  LogingLinesRequestModel({
    required this.id_log_materi_header,
    required this.id_materi,
    this.voice_try,
    required this.user_id,
  });

  Map<String, String> toMap() {
    return {
      'id_log_materi_header': id_log_materi_header,
      'id_materi': id_materi,
      // 'voice_try': voice_try?.toMap(),
      'user_id': user_id,
    };
  }

  factory LogingLinesRequestModel.fromMap(Map<String, dynamic> map) {
    return LogingLinesRequestModel(
      id_log_materi_header: map['id_log_materi_header'] ?? '',
      id_materi: map['id_materi'] ?? '',
      // voice_try:
      //     map['voice_try'] != null ? File.fromMap(map['voice_try']) : null,
      user_id: map['user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LogingLinesRequestModel.fromJson(String source) =>
      LogingLinesRequestModel.fromMap(json.decode(source));
}
