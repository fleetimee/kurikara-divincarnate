part of 'finish_materi_speaking_cubit.dart';

@freezed
class FinishMateriSpeakingState with _$FinishMateriSpeakingState {
  const factory FinishMateriSpeakingState.initial() = _Initial;
  const factory FinishMateriSpeakingState.loading() = _Loading;
  const factory FinishMateriSpeakingState.loaded(bool data) = _Loaded;
  const factory FinishMateriSpeakingState.error(String message) = _Error;
}
