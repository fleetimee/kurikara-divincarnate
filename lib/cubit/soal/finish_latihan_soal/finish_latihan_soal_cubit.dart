
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/finish_soal_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/soal_datasource.dart';

part 'finish_latihan_soal_cubit.freezed.dart';
part 'finish_latihan_soal_state.dart';

class FinishLatihanSoalCubit extends Cubit<FinishLatihanSoalState> {
  final SoalDatasource _soalDatasource;
  FinishLatihanSoalCubit(
    this._soalDatasource,
  ) : super(const FinishLatihanSoalState.initial());

  Future<void> finishLatihanSoal(FinishSoalRequestModel model) async {
    emit(const FinishLatihanSoalState.loading());
    final result = await _soalDatasource.postFinishLatihanSoal(model);
    result.fold(
      (l) => emit(FinishLatihanSoalState.error(l)),
      (r) => emit(FinishLatihanSoalState.loaded(r)),
    );
  }
}
