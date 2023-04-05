import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_lines_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/materi_datasource.dart';
import '../../../data/models/materi_pelajaran/loging_lines_response_model.dart';

part 'loging_lines_cubit.freezed.dart';
part 'loging_lines_state.dart';

class LogingLinesCubit extends Cubit<LogingLinesState> {
  final MateriDatasource _materiDatasource;
  LogingLinesCubit(
    this._materiDatasource,
  ) : super(const LogingLinesState.initial());

  Future<void> postLogingLines(LogingLinesRequestModel model) async {
    emit(const LogingLinesState.loading());
    final result = await _materiDatasource.postLogingLines(model);
    result.fold(
      (l) => emit(LogingLinesState.error(l)),
      (r) => emit(LogingLinesState.loaded(r)),
    );
  }
}
