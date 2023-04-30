import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_lines_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/materi_speaking_datasource.dart';
import '../../../data/models/materi_pelajaran/loging_lines_response_model.dart';

part 'loging_lines_speaking_cubit.freezed.dart';
part 'loging_lines_speaking_state.dart';

class LogingLinesSpeakingCubit extends Cubit<LogingLinesSpeakingState> {
  final MateriSpeakingDatasource _materiDatasource;
  LogingLinesSpeakingCubit(
    this._materiDatasource,
  ) : super(const LogingLinesSpeakingState.initial());

  Future<void> postLogingLines(LogingLinesRequestModel model) async {
    emit(const LogingLinesSpeakingState.loading());
    final result = await _materiDatasource.postLogingLines(model);
    result.fold(
      (l) => emit(LogingLinesSpeakingState.error(l)),
      (r) => emit(LogingLinesSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const LogingLinesSpeakingState.initial());
  }
}
