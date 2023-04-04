part of 'master_level_cubit.dart';

@freezed
class MasterLevelState with _$MasterLevelState {
  const factory MasterLevelState.initial() = _Initial;
  const factory MasterLevelState.loading() = _Loading;
  const factory MasterLevelState.loaded(MasterLevelResponseModel data) = _Loaded;
  const factory MasterLevelState.error(String message) = _Error;
}
