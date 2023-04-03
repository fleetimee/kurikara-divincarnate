import 'dart:convert';
import 'dart:html';

import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/login_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/register_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_fcm_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_profile_request_model.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  Future<AuthResponseModel> reqister(RegisterRequestModel model) async {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://huixin.id/api_register'));
    request.fields.addAll(model.toMap());
    request.files.add(
        await http.MultipartFile.fromPath('img_file', model.img_file!.path));

    http.StreamedResponse response = await request.send();

    return AuthResponseModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<AuthResponseModel> login(LoginRequestModel model) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
    };
    var request =
        http.Request('POST', Uri.parse('https://huixin.id/api_login'));
    request.bodyFields = model.toMap();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return AuthResponseModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<AuthResponseModel> updateProfile(
      UpdateProfileRequestModel model) async {
    var headers = {'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'};
    var request = http.MultipartRequest('POST',
        Uri.parse('https://huixin.id/api_update_profile/?token_api=323232'));
    request.fields.addAll(model.toMap());
    request.files.add(
        await http.MultipartFile.fromPath('img_file', model.img_file!.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    return AuthResponseModel.fromJson(
        jsonDecode(await response.stream.bytesToString()));
  }

  Future<bool> updateFcm(UpdateFcmRequestModel model) async {
    var headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
    };
    var request =
        http.Request('POST', Uri.parse('https://huixin.id/api_update_fcm'));
    request.bodyFields = model.toMap();
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
