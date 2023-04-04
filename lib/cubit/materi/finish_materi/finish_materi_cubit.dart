import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/finish_materi_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/materi_datasource.dart';

part 'finish_materi_cubit.freezed.dart';
part 'finish_materi_state.dart';

class FinishMateriCubit extends Cubit<FinishMateriState> {
  final MateriDatasource _materiDatasource;
  FinishMateriCubit(
    this._materiDatasource,
  ) : super(const FinishMateriState.initial());

  Future<void> finishMateri(FinishMateriRequestModel model) async {
    emit(const FinishMateriState.loading());
    final result = await _materiDatasource.postFinishMateri(model);
    result.fold(
      (l) => emit(FinishMateriState.error(l)),
      (r) => emit(FinishMateriState.loaded(r)),
    );
  }
}
