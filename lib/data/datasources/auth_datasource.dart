import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/delete_user_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/login_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/register_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_fcm_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_profile_request_model.dart';
import 'package:http/http.dart' as http_plus;
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../common/constants/api.dart';

class AuthDataSource {
  HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  Future<String> getToken() async {
    final token = await AppSecureStorage.getAccessToken();
    return 'token_api=$token';
  }

  Future<Either<String, AuthResponseModel>> register(
      RegisterRequestModel model) async {
    try {
      var request = http_plus.MultipartRequest(
          'POST', Uri.parse('${AppApi.baseUrl}/api_register'));
      request.fields.addAll(model.toMap());
      request.files.add(await http_plus.MultipartFile.fromPath(
          'img_file', model.img_file!.path));

      http_plus.StreamedResponse response = await request.send();

      return Right(
        AuthResponseModel.fromJson(
            jsonDecode(await response.stream.bytesToString())),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponseModel>> registerSosmed(
      RegisterRequestModel model) async {
    try {
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
      };
      final response = await http.post(
        Uri.parse('${AppApi.baseUrl}/api_register'),
        body: model.toMap(),
        headers: headers,
      );

      return Right(
        AuthResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponseModel>> login(
      LoginRequestModel model) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
      };
      var response = await http.post(Uri.parse('${AppApi.baseUrl}/api_login'),
          headers: headers, body: model.toMap());

      return Right(
        AuthResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponseModel>> updateProfile(
      UpdateProfileRequestModel model) async {
    try {
      var headers = {'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'};
      var request = http_plus.MultipartRequest('POST',
          Uri.parse('${AppApi.baseUrl}/api_update_profile/?token_api=323232'));
      request.fields.addAll(model.toMap());
      // request.files.add(await http_plus.MultipartFile.fromPath(
      //     'img_file', model.img_file!.path));
      request.headers.addAll(headers);

      http_plus.StreamedResponse response = await request.send();

      return Right(
        AuthResponseModel.fromJson(
            jsonDecode(await response.stream.bytesToString())),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> updateFcm(UpdateFcmRequestModel model) async {
    try {
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
      };
      var response = await http.post(
          Uri.parse('${AppApi.baseUrl}/api_update_fcm'),
          body: model.toMap(),
          headers: headers);

      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, AuthResponseModel>> deleteUser(
      DeleteUserRequestModel model) async {
    try {
      final headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'ci_session=ouvp29be2csimiohsjvhpt90oo3ejgcs'
      };

      final response = await http.post(
        Uri.parse('${AppApi.baseUrl}/api_delete_profile?${await getToken()}'),
        body: model.toMap(),
        headers: headers,
      );

      return Right(
        AuthResponseModel.fromJson(
          jsonDecode(response.body),
        ),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
