import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';

import '../../../data/models/mastering/master_soal_response_model.dart';

part 'master_soal_speaking_cubit.freezed.dart';
part 'master_soal_speaking_state.dart';

class MasterSoalSpeakingCubit extends Cubit<MasterSoalSpeakingState> {
  final MasteringDatasource _masteringDatasource;
  MasterSoalSpeakingCubit(
    this._masteringDatasource,
  ) : super(const MasterSoalSpeakingState.initial());

  Future<void> getMasterSoalSpeaking(
      String userId, String levelId, String groupId) async {
    emit(const MasterSoalSpeakingState.loading());
    final result = await _masteringDatasource.getMasterSoalSpeaking(
        userId, levelId, groupId);
    result.fold(
      (l) => emit(MasterSoalSpeakingState.error(l)),
      (r) => emit(MasterSoalSpeakingState.loaded(
          r, 0, r.data!.isNotEmpty && r.data!.length > 1)),
    );
  }

  void nextContent() {
    final currentState = state as _$_Loaded;
    emit(currentState.copyWith(
        index: currentState.index + 1,
        isNext: currentState.data.data!.length > currentState.index + 2));
  }

  setInitial() {
    emit(const MasterSoalSpeakingState.initial());
  }
}
