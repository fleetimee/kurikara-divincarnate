import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/datasources/speaking_datasource.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/models/latihan_soal/latihan_lines_response_model.dart';


part 'latihan_soal_lines_speaking_cubit.freezed.dart';
part 'latihan_soal_lines_speaking_state.dart';

class LatihanSoalLinesSpeakingCubit
    extends Cubit<LatihanSoalLinesSpeakingState> {
  final SpeakingDatasource _soalDatasource;
  LatihanSoalLinesSpeakingCubit(
    this._soalDatasource,
  ) : super(const LatihanSoalLinesSpeakingState.initial());

  Future<void> postLatihanSoalLines(LatihanLinesRequestModel model) async {
    emit(const LatihanSoalLinesSpeakingState.loading());
    final result = await _soalDatasource.postLatihanSoalLines(model);
    result.fold(
      (l) => emit(LatihanSoalLinesSpeakingState.error(l)),
      (r) => emit(LatihanSoalLinesSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const LatihanSoalLinesSpeakingState.initial());
  }
}
