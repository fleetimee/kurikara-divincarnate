import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_daily_activity_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_info_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_xp_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../common/constants/api.dart';

class HomeDatasource {
  HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);
  
  Future<String> getToken() async {
    final token = await AppSecureStorage.getAccessToken();
    return 'token_api=$token';
  }

  Future<Either<String, GetInfoResponseModel>> getInfo(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_info?${await getToken()}&user_id=$userId'));
      return Right(
        GetInfoResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetActiveStudentResponseModel>>
      getActiveStudent() async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_active_student?${await getToken()}'));
      return Right(
        GetActiveStudentResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetDailyActivityResponseModel>> getDailyActivity(
      String userId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_daily_activity?${await getToken()}&user_id=$userId'));
      return Right(
        GetDailyActivityResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetXpResponseModel>> getXp(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_xp?${await getToken()}&user_id=$userId'));
      return Right(
        GetXpResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
