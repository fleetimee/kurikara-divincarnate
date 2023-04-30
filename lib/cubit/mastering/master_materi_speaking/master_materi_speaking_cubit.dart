import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';

import '../../../data/models/mastering/master_materi_response_model.dart';

part 'master_materi_speaking_cubit.freezed.dart';
part 'master_materi_speaking_state.dart';

class MasterMateriSpeakingCubit extends Cubit<MasterMateriSpeakingState> {
  final MasteringDatasource _masteringDatasource;
  MasterMateriSpeakingCubit(
    this._masteringDatasource,
  ) : super(const MasterMateriSpeakingState.initial());

  Future<void> getMasterMateriSpeaking(
      String userId, String levelId, String groupId) async {
    emit(const MasterMateriSpeakingState.loading());
    final result =
        await _masteringDatasource.getMasterMateriSpeaking(userId, levelId, groupId);
    result.fold(
      (l) => emit(MasterMateriSpeakingState.error(l)),
      (r) => emit(MasterMateriSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const MasterMateriSpeakingState.initial());
  }
}
