// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class FinishMateriRequestModel {
  final String user_id;
  final String id_level;
  final String id_group_materi;
  final String id_lesson;
  final String mode;
  FinishMateriRequestModel({
    required this.user_id,
    required this.id_level,
    required this.id_group_materi,
    required this.id_lesson,
    required this.mode,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'id_level': id_level,
      'id_group_materi': id_group_materi,
      'id_lesson': id_lesson,
      'mode': mode,
    };
  }

  factory FinishMateriRequestModel.fromMap(Map<String, dynamic> map) {
    return FinishMateriRequestModel(
      user_id: map['user_id'] ?? '',
      id_level: map['id_level'] ?? '',
      id_group_materi: map['id_group_materi'] ?? '',
      id_lesson: map['id_lesson'] ?? '',
      mode: map['mode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FinishMateriRequestModel.fromJson(String source) =>
      FinishMateriRequestModel.fromMap(json.decode(source));

  FinishMateriRequestModel copyWith({
    String? user_id,
    String? id_level,
    String? id_group_materi,
    String? id_lesson,
    String? mode,
  }) {
    return FinishMateriRequestModel(
      user_id: user_id ?? this.user_id,
      id_level: id_level ?? this.id_level,
      id_group_materi: id_group_materi ?? this.id_group_materi,
      id_lesson: id_lesson ?? this.id_lesson,
      mode: mode ?? this.mode,
    );
  }

  @override
  String toString() {
    return 'FinishMateriRequestModel(user_id: $user_id, id_level: $id_level, id_group_materi: $id_group_materi, id_lesson: $id_lesson, mode: $mode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is FinishMateriRequestModel &&
      other.user_id == user_id &&
      other.id_level == id_level &&
      other.id_group_materi == id_group_materi &&
      other.id_lesson == id_lesson &&
      other.mode == mode;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^
      id_level.hashCode ^
      id_group_materi.hashCode ^
      id_lesson.hashCode ^
      mode.hashCode;
  }
}
