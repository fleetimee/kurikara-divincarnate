import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_daily_activity_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_info_response_model.dart';
import 'package:flutter_huixin_app/data/models/get_xp_response_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/api.dart';

class HomeDatasource {
  String getToken() {
    return 'token_api=323232';
  }

  Future<Either<String, GetInfoResponseModel>> getInfo(String userId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_info?${getToken()}&user_id=$userId'));
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
      final response = await http
          .get(Uri.parse('${AppApi.baseUrl}/api_active_student?${getToken()}'));
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
          '${AppApi.baseUrl}/api_daily_activity?${getToken()}&user_id=$userId'));
      return Right(
        GetDailyActivityResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, GetXpResponseModel>> getXP(String userId) async {
    try {
      final response = await http.get(
          Uri.parse('${AppApi.baseUrl}/api_xp?${getToken()}&user_id=$userId'));
      return Right(
        GetXpResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
