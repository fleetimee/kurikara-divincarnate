import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/models/latihan_soal/latihan_lines_response_model.dart';

import '../../../data/datasources/soal_datasource.dart';

part 'latihan_soal_lines_cubit.freezed.dart';
part 'latihan_soal_lines_state.dart';

class LatihanSoalLinesCubit extends Cubit<LatihanSoalLinesState> {
  final SoalDatasource _soalDatasource;
  LatihanSoalLinesCubit(
    this._soalDatasource,
  ) : super(const LatihanSoalLinesState.initial());

  Future<void> postLatihanSoalLines(LatihanLinesRequestModel model) async {
    emit(const LatihanSoalLinesState.loading());
    final result = await _soalDatasource.postLatihanSoalLines(model);
    result.fold(
      (l) => emit(LatihanSoalLinesState.error(l)),
      (r) => emit(LatihanSoalLinesState.loaded(r)),
    );
  }

  setInitial() {
    emit(const LatihanSoalLinesState.initial());
  }
}
