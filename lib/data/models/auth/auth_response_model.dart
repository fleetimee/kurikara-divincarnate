import 'dart:convert';

class AuthResponseModel {
  AuthResponseModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  DataUser? data;

  factory AuthResponseModel.fromRawJson(String str) =>
      AuthResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : DataUser.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class DataUser {
  DataUser({
    this.userId,
    this.userNpp,
    this.userName,
    this.fullName,
    this.noMember,
    // this.birthDate,
    this.userPassword,
    this.passwordText,
    this.userRole,
    this.userCounter,
    this.userViolation,
    this.userIsAssign,
    this.userIsActive,
    this.userIsDelete,
    this.userUpdateBy,
    this.userUpdateDate,
    this.idGoogle,
    this.idFb,
    this.idApple,
    this.fcmId,
    this.tokenApi,
    this.tokenDevice,
    this.email,
    this.noTelpon,
    this.imgFile,
  });

  String? userId;
  String? userNpp;
  String? userName;
  String? fullName;
  String? noMember;
  // DateTime? birthDate;
  String? userPassword;
  String? passwordText;
  String? userRole;
  String? userCounter;
  String? userViolation;
  String? userIsAssign;
  String? userIsActive;
  String? userIsDelete;
  dynamic userUpdateBy;
  DateTime? userUpdateDate;
  String? idGoogle;
  String? idFb;
  String? idApple;
  String? fcmId;
  String? tokenApi;
  String? tokenDevice;
  String? email;
  String? noTelpon;
  String? imgFile;

  factory DataUser.fromRawJson(String str) =>
      DataUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        userId: json["user_id"],
        userNpp: json["user_npp"],
        userName: json["user_name"],
        fullName: json["full_name"],
        noMember: json["no_member"],
        // birthDate: json["birth_date"] == null
        //     ? null
        //     : DateTime.parse(json["birth_date"]),
        userPassword: json["user_password"],
        passwordText: json["password_text"],
        userRole: json["user_role"],
        userCounter: json["user_counter"],
        userViolation: json["user_violation"],
        userIsAssign: json["user_is_assign"],
        userIsActive: json["user_is_active"],
        userIsDelete: json["user_is_delete"],
        userUpdateBy: json["user_update_by"],
        userUpdateDate: json["user_update_date"] == null
            ? null
            : DateTime.parse(json["user_update_date"]),
        idGoogle: json["id_google"],
        idFb: json["id_fb"],
        idApple: json["id_apple"],
        fcmId: json["fcm_id"],
        tokenApi: json["token_api"],
        tokenDevice: json["token_device"],
        email: json["email"],
        noTelpon: json["no_telpon"],
        imgFile: json["img_file"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_npp": userNpp,
        "user_name": userName,
        "full_name": fullName,
        "no_member": noMember,
        // "birth_date":
        //     "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "user_password": userPassword,
        "password_text": passwordText,
        "user_role": userRole,
        "user_counter": userCounter,
        "user_violation": userViolation,
        "user_is_assign": userIsAssign,
        "user_is_active": userIsActive,
        "user_is_delete": userIsDelete,
        "user_update_by": userUpdateBy,
        "user_update_date": userUpdateDate?.toIso8601String(),
        "id_google": idGoogle,
        "id_fb": idFb,
        "id_apple": idApple,
        "fcm_id": fcmId,
        "token_api": tokenApi,
        "token_device": tokenDevice,
        "email": email,
        "no_telpon": noTelpon,
        "img_file": imgFile,
      };
}
