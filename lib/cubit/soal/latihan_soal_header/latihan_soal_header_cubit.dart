import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_header_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/soal_datasource.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/latihan_header_response_model.dart';

part 'latihan_soal_header_cubit.freezed.dart';
part 'latihan_soal_header_state.dart';

class LatihanSoalHeaderCubit extends Cubit<LatihanSoalHeaderState> {
  final SoalDatasource _soalDatasource;
  LatihanSoalHeaderCubit(
    this._soalDatasource,
  ) : super(const LatihanSoalHeaderState.initial());

  Future<void> getLatihanSoalHeader(LatihanHeaderRequestModel model) async {
    emit(const LatihanSoalHeaderState.loading());
    final result = await _soalDatasource.postLatihanSoalHeader(model);
    result.fold(
      (l) => emit(LatihanSoalHeaderState.error(l)),
      (r) => emit(LatihanSoalHeaderState.loaded(r)),
    );
  }
}
