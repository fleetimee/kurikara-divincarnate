import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_huixin_app/data/models/report/report_list_response_model.dart';
import 'package:pretty_http_logger/pretty_http_logger.dart';

import '../../common/constants/api.dart';
import 'local/app_secure_storage.dart';

class ReportDataSource {
  HttpWithMiddleware http = HttpWithMiddleware.build(middlewares: [
    HttpLogger(logLevel: LogLevel.BODY),
  ]);

  Future<String> getToken() async {
    final token = await AppSecureStorage.getAccessToken();
    return 'token_api=$token';
  }

  Future<Either<String, ReportListResponseModel>> getReportList(
    String userId,
  ) async {
    try {
      final response = await http.get(Uri.parse(
          '${AppApi.baseUrl}/report?${await getToken()}&user_id=$userId'));
      return Right(
        ReportListResponseModel.fromJson(jsonDecode(response.body)),
      );
    } catch (e) {
      return Left(e.toString());
    }
  }
}
