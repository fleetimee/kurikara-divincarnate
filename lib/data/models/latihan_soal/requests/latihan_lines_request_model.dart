// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class LatihanLinesRequestModel {
  final String id_log_soal_header;
  final String id_soal;
  final String tipe;
  final String pg_answer;
  final String cocok_answer;
  File? voice_answer;
  final bool status;
  final String user_id;
  LatihanLinesRequestModel({
    required this.id_log_soal_header,
    required this.id_soal,
    required this.tipe,
    required this.pg_answer,
    required this.cocok_answer,
    this.voice_answer,
    required this.status,
    required this.user_id,
  });

  Map<String, String> toMap() {
    return {
      'id_log_soal_header': id_log_soal_header,
      'id_soal': id_soal,
      'tipe': tipe,
      'pg_answer': pg_answer,
      'cocok_answer': cocok_answer,
      // 'voice_answer': voice_answer?.toMap(),
      'status': status ? 'true' : 'false',
      'user_id': user_id,
    };
  }

  factory LatihanLinesRequestModel.fromMap(Map<String, dynamic> map) {
    return LatihanLinesRequestModel(
      id_log_soal_header: map['id_log_soal_header'] ?? '',
      id_soal: map['id_soal'] ?? '',
      tipe: map['tipe'] ?? '',
      pg_answer: map['pg_answer'] ?? '',
      cocok_answer: map['cocok_answer'] ?? '',
      // voice_answer: map['voice_answer'] != null ? File.fromMap(map['voice_answer']) : null,
      status: map['status'] ?? '',
      user_id: map['user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LatihanLinesRequestModel.fromJson(String source) =>
      LatihanLinesRequestModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LatihanLinesRequestModel(id_log_soal_header: $id_log_soal_header, id_soal: $id_soal, tipe: $tipe, pg_answer: $pg_answer, cocok_answer: $cocok_answer, voice_answer: $voice_answer, status: $status, user_id: $user_id)';
  }
}
