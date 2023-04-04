import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/mastering_datasource.dart';
import '../../../data/models/mastering/master_level_response_model.dart';

part 'master_level_cubit.freezed.dart';
part 'master_level_state.dart';

class MasterLevelCubit extends Cubit<MasterLevelState> {
  final MasteringDatasource _masteringDatasource;
  MasterLevelCubit(
    this._masteringDatasource,
  ) : super(const MasterLevelState.initial());

  Future<void> getMasterLevel(String userId) async {
    emit(const MasterLevelState.loading());
    final result = await _masteringDatasource.getMasterLevel(userId);
    result.fold(
      (l) => emit(MasterLevelState.error(l)),
      (r) => emit(MasterLevelState.loaded(r)),
    );
  }
}
