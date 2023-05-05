// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class FinishSoalRequestModel {
  final String user_id;
  final String id_level;
  final String id_group_materi;
  final String id_lesson;

  FinishSoalRequestModel({
    required this.user_id,
    required this.id_level,
    required this.id_group_materi,
    required this.id_lesson,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'id_level': id_level,
      'id_group_materi': id_group_materi,
      'id_lesson': id_lesson,
    };
  }

  factory FinishSoalRequestModel.fromMap(Map<String, dynamic> map) {
    return FinishSoalRequestModel(
      user_id: map['user_id'] ?? '',
      id_level: map['id_level'] ?? '',
      id_group_materi: map['id_group_materi'] ?? '',
      id_lesson: map['id_lesson'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FinishSoalRequestModel.fromJson(String source) =>
      FinishSoalRequestModel.fromMap(json.decode(source));
}
