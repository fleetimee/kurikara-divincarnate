
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/data/datasources/speaking_datasource.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/finish_soal_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/soal_datasource.dart';

part 'finish_latihan_soal_speaking_cubit.freezed.dart';
part 'finish_latihan_soal_speaking_state.dart';

class FinishLatihanSoalSpeakingCubit extends Cubit<FinishLatihanSoalSpeakingState> {
  final SpeakingDatasource _soalDatasource;
  FinishLatihanSoalSpeakingCubit(
    this._soalDatasource,
  ) : super(const FinishLatihanSoalSpeakingState.initial());

  Future<void> finishLatihanSoal(FinishSoalRequestModel model) async {
    emit(const FinishLatihanSoalSpeakingState.loading());
    final result = await _soalDatasource.postFinishLatihanSoal(model);
    result.fold(
      (l) => emit(FinishLatihanSoalSpeakingState.error(l)),
      (r) => emit(FinishLatihanSoalSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const FinishLatihanSoalSpeakingState.initial());
  }
}
