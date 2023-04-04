// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';

class UpdateProfileRequestModel {
  final String user_id;
  final String user_npp;
  final String full_name;
  final String user_name;
  final String user_password;
  final String id_google;
  final String id_fb;
  final String id_apple;
  final String fcm_id;
  final String token_device;
  final String email;
  final String no_telpon;
  File? img_file;
  final String no_member;
  final String birth_date;
  UpdateProfileRequestModel({
    required this.user_id,
    required this.user_npp,
    required this.full_name,
    required this.user_name,
    required this.user_password,
    required this.id_google,
    required this.id_fb,
    required this.id_apple,
    required this.fcm_id,
    required this.token_device,
    required this.email,
    required this.no_telpon,
    this.img_file,
    required this.no_member,
    required this.birth_date,
  });

  Map<String, String> toMap() {
    return {
      'user_id': user_id,
      'user_npp': user_npp,
      'full_name': full_name,
      'user_name': user_name,
      'user_password': user_password,
      'id_google': id_google,
      'id_fb': id_fb,
      'id_apple': id_apple,
      'fcm_id': fcm_id,
      'token_device': token_device,
      'email': email,
      'no_telpon': no_telpon,
      // 'img_file': img_file?.toMap(),
      'no_member': no_member,
      'birth_date': birth_date,
    };
  }

  factory UpdateProfileRequestModel.fromMap(Map<String, dynamic> map) {
    return UpdateProfileRequestModel(
      user_id: map['user_id'] ?? '',
      user_npp: map['user_npp'] ?? '',
      full_name: map['full_name'] ?? '',
      user_name: map['user_name'] ?? '',
      user_password: map['user_password'] ?? '',
      id_google: map['id_google'] ?? '',
      id_fb: map['id_fb'] ?? '',
      id_apple: map['id_apple'] ?? '',
      fcm_id: map['fcm_id'] ?? '',
      token_device: map['token_device'] ?? '',
      email: map['email'] ?? '',
      no_telpon: map['no_telpon'] ?? '',
      // img_file: map['img_file'] != null ? File.fromMap(map['img_file']) : null,
      no_member: map['no_member'] ?? '',
      birth_date: map['birth_date'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileRequestModel.fromJson(String source) =>
      UpdateProfileRequestModel.fromMap(json.decode(source));
}
