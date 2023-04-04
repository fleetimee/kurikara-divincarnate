import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/loging_header_response_model.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/loging_lines_response_model.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/finish_materi_request_model.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_lines_request_model.dart';
import 'package:http/http.dart' as http;

import '../../common/constants/api.dart';
import 'local/app_secure_storage.dart';

class MateriDatasource {
  Future<String> getToken() async {
    final token = await AppSecureStorage.getAccessToken();
    return 'token_api=$token';
  }

  Future<Either<String, LogingHeaderResponseModel>> postLogingHeader(
      LogingHeaderRequestModel model) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final response = await http.post(
        Uri.parse('${AppApi.baseUrl}/loging_header?${await getToken()}'),
        headers: headers,
        body: model.toMap(),
      );
      return Right(
        LogingHeaderResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LogingLinesResponseModel>> postLogingLines(
      LogingLinesRequestModel model) async {
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('${AppApi.baseUrl}/loging_lines?${await getToken()}'));
      request.fields.addAll(model.toMap());
      request.files.add(
        await http.MultipartFile.fromPath('voice_try', model.voice_try!.path),
      );

      http.StreamedResponse response = await request.send();

      return Right(
        LogingLinesResponseModel.fromJson(
            jsonDecode(await response.stream.bytesToString())),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, bool>> postFinishMateri(
      FinishMateriRequestModel model) async {
    try {
      var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
      final response = await http.post(
        Uri.parse('${AppApi.baseUrl}/finish_materi?${await getToken()}'),
        headers: headers,
        body: model.toMap(),
      );
      return Right(response.statusCode == 200);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
