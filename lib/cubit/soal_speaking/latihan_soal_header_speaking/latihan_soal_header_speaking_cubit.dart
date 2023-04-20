import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/datasources/speaking_datasource.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_header_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/soal_datasource.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/latihan_header_response_model.dart';

part 'latihan_soal_header_speaking_cubit.freezed.dart';
part 'latihan_soal_header_speaking_state.dart';

class LatihanSoalHeaderSpeakingCubit extends Cubit<LatihanSoalHeaderSpeakingState> {
  final SpeakingDatasource _soalDatasource;
  LatihanSoalHeaderSpeakingCubit(
    this._soalDatasource,
  ) : super(const LatihanSoalHeaderSpeakingState.initial());

  Future<void> postLatihanSoalHeader(LatihanHeaderRequestModel model) async {
    emit(const LatihanSoalHeaderSpeakingState.loading());
    final result = await _soalDatasource.postLatihanSoalHeader(model);
    result.fold(
      (l) => emit(LatihanSoalHeaderSpeakingState.error(l)),
      (r) => emit(LatihanSoalHeaderSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const LatihanSoalHeaderSpeakingState.initial());
  }
}
