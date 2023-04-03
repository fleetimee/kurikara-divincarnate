import 'dart:convert';

class UpdateFcmRequestModel {
  final String user_id;
  final String fcm_id;
  UpdateFcmRequestModel({
    required this.user_id,
    required this.fcm_id,
  });

  Map<String, String> toMap() {
    return {
      'user_id': user_id,
      'fcm_id': fcm_id,
    };
  }

  factory UpdateFcmRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateFcmRequestModel(
      user_id: map['user_id'] ?? '',
      fcm_id: map['fcm_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateFcmRequestModel.fromJson(String source) =>
      UpdateFcmRequestModel.fromMap(json.decode(source));
}
