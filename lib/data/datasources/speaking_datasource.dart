import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http_plus;
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../common/constants/api.dart';
import '../models/latihan_soal/latihan_header_response_model.dart';
import '../models/latihan_soal/latihan_lines_response_model.dart';
import '../models/latihan_soal/requests/finish_soal_request_model.dart';
import '../models/latihan_soal/requests/latihan_header_request_model.dart';
import '../models/latihan_soal/requests/latihan_lines_request_model.dart';
import 'local/app_secure_storage.dart';

class SpeakingDatasource {
  HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);
  Future<String> getToken() async {
    final token = await AppSecureStorage.getAccessToken();
    return 'token_api=$token';
  }

  Future<Either<String, LatihanHeaderResponseModel>> postLatihanSoalHeader(
      LatihanHeaderRequestModel model) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final response = await http.post(
        Uri.parse(
            '${AppApi.baseUrl}/latihan_header_speaking?${await getToken()}'),
        headers: headers,
        body: model.toMap(),
      );
      return Right(
        LatihanHeaderResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LatihanLinesResponseModel>> postLatihanSoalLines(
      LatihanLinesRequestModel model) async {
    try {
      debugPrint(model.toString());
      var request = http_plus.MultipartRequest(
          'POST',
          Uri.parse(
              '${AppApi.baseUrl}/latihan_lines_speaking?${await getToken()}'));
      request.fields.addAll(model.toMap());
      if (model.voice_answer != null) {
        request.files.add(await http_plus.MultipartFile.fromPath(
            'voice_answer', model.voice_answer!.path));
      }
      if (model.voice_answer_2 != null) {
        request.files.add(await http_plus.MultipartFile.fromPath(
            'voice_answer_2', model.voice_answer_2!.path));
      }

      http_plus.StreamedResponse response = await request.send();
      return Right(
        LatihanLinesResponseModel.fromJson(
            jsonDecode(await response.stream.bytesToString())),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> postFinishLatihanSoal(
      FinishSoalRequestModel model) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final response = await http.post(
        Uri.parse('${AppApi.baseUrl}/finish_soal?${await getToken()}'),
        headers: headers,
        body: model.toMap(),
      );
      return Right(response.statusCode == 200);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
