import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';

import '../../../data/models/mastering/master_soal_response_model.dart';

part 'master_soal_cubit.freezed.dart';
part 'master_soal_state.dart';

class MasterSoalCubit extends Cubit<MasterSoalState> {
  final MasteringDatasource _masteringDatasource;
  MasterSoalCubit(
    this._masteringDatasource,
  ) : super(const MasterSoalState.initial());

  Future<void> getMasterSoal(
      String userId, String levelId, String groupId) async {
    emit(const MasterSoalState.loading());
    final result =
        await _masteringDatasource.getMasterSoal(userId, levelId, groupId);
    result.fold(
      (l) => emit(MasterSoalState.error(l)),
      (r) => emit(MasterSoalState.loaded(r, 0, r.data!.isNotEmpty)),
    );
  }

  void nextContent() {
    final currentState = state as _$_Loaded;
    emit(currentState.copyWith(
        index: currentState.index + 1,
        isNext: currentState.data.data!.length > currentState.index + 2));
  }

  setInitial() {
    emit(const MasterSoalState.initial());
  }
}
