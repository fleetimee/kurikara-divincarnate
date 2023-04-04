part of 'master_materi_cubit.dart';

@freezed
class MasterMateriState with _$MasterMateriState {
  const factory MasterMateriState.initial() = _Initial;
  const factory MasterMateriState.loading() = _Loading;
  const factory MasterMateriState.loaded(MasterMateriResponseModel data) = _Loaded;
  const factory MasterMateriState.error(String message) = _Error;
}
