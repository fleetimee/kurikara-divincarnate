import 'dart:convert';

class LoginRequestModel {
  final String username;
  final String password;
  String? id_google;
  String? id_fb;
  String? id_apple;
  LoginRequestModel({
    required this.username,
    required this.password,
    this.id_google,
    this.id_fb,
    this.id_apple,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'id_google': id_google,
      'id_fb': id_fb,
      'id_apple': id_apple,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      id_google: map['id_google'],
      id_fb: map['id_fb'],
      id_apple: map['id_apple'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source));
}
