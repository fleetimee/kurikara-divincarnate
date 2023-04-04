import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';

import '../../../data/models/mastering/master_materi_response_model.dart';

part 'master_materi_cubit.freezed.dart';
part 'master_materi_state.dart';

class MasterMateriCubit extends Cubit<MasterMateriState> {
  final MasteringDatasource _masteringDatasource;
  MasterMateriCubit(
    this._masteringDatasource,
  ) : super(const MasterMateriState.initial());

  Future<void> getMasterMateri(
      String userId, String levelId, String groupId) async {
    emit(const MasterMateriState.loading());
    final result =
        await _masteringDatasource.getMasterMateri(userId, levelId, groupId);
    result.fold(
      (l) => emit(MasterMateriState.error(l)),
      (r) => emit(MasterMateriState.loaded(r)),
    );
  }
}
