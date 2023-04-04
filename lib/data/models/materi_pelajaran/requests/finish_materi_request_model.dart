// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class FinishMateriRequestModel {
  final String user_id;
  final String id_level;
  final String id_group_materi;
  FinishMateriRequestModel({
    required this.user_id,
    required this.id_level,
    required this.id_group_materi,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'id_level': id_level,
      'id_group_materi': id_group_materi,
    };
  }

  factory FinishMateriRequestModel.fromMap(Map<String, dynamic> map) {
    return FinishMateriRequestModel(
      user_id: map['user_id'] ?? '',
      id_level: map['id_level'] ?? '',
      id_group_materi: map['id_group_materi'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FinishMateriRequestModel.fromJson(String source) =>
      FinishMateriRequestModel.fromMap(json.decode(source));
}
