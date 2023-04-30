part of 'finish_latihan_soal_speaking_cubit.dart';

@freezed
class FinishLatihanSoalSpeakingState with _$FinishLatihanSoalSpeakingState {
  const factory FinishLatihanSoalSpeakingState.initial() = _Initial;
  const factory FinishLatihanSoalSpeakingState.loading() = _Loading;
  const factory FinishLatihanSoalSpeakingState.loaded(bool data) = _Loaded;
  const factory FinishLatihanSoalSpeakingState.error(String message) = _Error;
}
