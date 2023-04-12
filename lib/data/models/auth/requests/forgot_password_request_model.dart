// To parse this JSON data, do
//
//     final forgotPasswordRequestModel = forgotPasswordRequestModelFromJson(jsonString);

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

ForgotPasswordRequestModel forgotPasswordRequestModelFromJson(String str) =>
    ForgotPasswordRequestModel.fromJson(json.decode(str));

String forgotPasswordRequestModelToJson(ForgotPasswordRequestModel data) =>
    json.encode(data.toJson());

class ForgotPasswordRequestModel {
  ForgotPasswordRequestModel({
    required this.email_penerima,
  });

  String email_penerima;

  factory ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequestModel(
        email_penerima: json["email_penerima"],
      );

  Map<String, dynamic> toJson() => {
        "email_penerima": email_penerima,
      };

  Map<String, String> toMap() {
    return {
      'email_penerima': email_penerima,
    };
  }
}
