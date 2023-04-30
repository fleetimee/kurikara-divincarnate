part of 'master_materi_speaking_cubit.dart';

@freezed
class MasterMateriSpeakingState with _$MasterMateriSpeakingState {
  const factory MasterMateriSpeakingState.initial() = _Initial;
  const factory MasterMateriSpeakingState.loading() = _Loading;
  const factory MasterMateriSpeakingState.loaded(MasterMateriResponseModel data) = _Loaded;
  const factory MasterMateriSpeakingState.error(String message) = _Error;
}
