import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_level_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_materi_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_soal_response_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/api.dart';

class MasteringDatasource {
  String getToken() {
    return 'token_api=323232';
  }

  Future<Either<String, MasterLevelResponseModel>> getMasterLevel(
      String userId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_level?${getToken()}&user_id=$userId'));
      return Right(
        MasterLevelResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MasterGroupMateriResponseModel>> getMasterGroupMateri(
      String userId, String levelId) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_group_materi?${getToken()}&user_id=$userId&id_level=$levelId'));
      return Right(
        MasterGroupMateriResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MasterMateriResponseModel>> getMasterMateri(
      String userId, String idLevel, String idGroupMateri) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_materi?${getToken()}&user_id=$userId&id_level=$idLevel&id_group_materi=$idGroupMateri'));
      return Right(
        MasterMateriResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, MasterSoalResponseModel>> getMasterSoal(
      String userId, String idLevel, String idGroupMateri) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/api_soal?${getToken()}&user_id=$userId&id_level=$idLevel&id_group_materi=$idGroupMateri'));
      return Right(
        MasterSoalResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
