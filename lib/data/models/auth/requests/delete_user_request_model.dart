// To parse this JSON data, do
//
//     final deleteUserRequestModel = deleteUserRequestModelFromJson(jsonString);

import 'dart:convert';

DeleteUserRequestModel deleteUserRequestModelFromJson(String str) =>
    DeleteUserRequestModel.fromJson(json.decode(str));

String deleteUserRequestModelToJson(DeleteUserRequestModel data) =>
    json.encode(data.toJson());

class DeleteUserRequestModel {
  DeleteUserRequestModel({
    required this.userId,
  });

  int userId;

  factory DeleteUserRequestModel.fromJson(Map<String, dynamic> json) =>
      DeleteUserRequestModel(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };

  Map<String, int> toMap() {
    return {
      'user_id': userId,
    };
  }
}
