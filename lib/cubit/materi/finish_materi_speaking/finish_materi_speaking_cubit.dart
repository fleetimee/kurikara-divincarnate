import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/finish_materi_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../data/datasources/materi_speaking_datasource.dart';

part 'finish_materi_speaking_cubit.freezed.dart';
part 'finish_materi_speaking_state.dart';

class FinishMateriSpeakingCubit extends Cubit<FinishMateriSpeakingState> {
  final MateriSpeakingDatasource _materiDatasource;
  FinishMateriSpeakingCubit(
    this._materiDatasource,
  ) : super(const FinishMateriSpeakingState.initial());

  Future<void> finishMateri(FinishMateriRequestModel model) async {
    emit(const FinishMateriSpeakingState.loading());
    final result = await _materiDatasource.postFinishMateri(model);
    result.fold(
      (l) => emit(FinishMateriSpeakingState.error(l)),
      (r) => emit(FinishMateriSpeakingState.loaded(r)),
    );
  }
}
