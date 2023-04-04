import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/mastering_datasource.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';

part 'master_group_materi_cubit.freezed.dart';
part 'master_group_materi_state.dart';

class MasterGroupMateriCubit extends Cubit<MasterGroupMateriState> {
  final MasteringDatasource _masteringDatasource;
  MasterGroupMateriCubit(
    this._masteringDatasource,
  ) : super(const MasterGroupMateriState.initial());

  Future<void> getMasterGroupMateri(String userId, String levelId) async {
    emit(const MasterGroupMateriState.loading());
    final result =
        await _masteringDatasource.getMasterGroupMateri(userId, levelId);
    result.fold(
      (l) => emit(MasterGroupMateriState.error(l)),
      (r) => emit(MasterGroupMateriState.loaded(r)),
    );
  }
}
