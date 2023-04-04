part of 'master_group_materi_cubit.dart';

@freezed
class MasterGroupMateriState with _$MasterGroupMateriState {
  const factory MasterGroupMateriState.initial() = _Initial;
  const factory MasterGroupMateriState.loading() = _Loading;
  const factory MasterGroupMateriState.loaded(MasterGroupMateriResponseModel data) = _Loaded;
  const factory MasterGroupMateriState.error(String message) = _Error;
}
