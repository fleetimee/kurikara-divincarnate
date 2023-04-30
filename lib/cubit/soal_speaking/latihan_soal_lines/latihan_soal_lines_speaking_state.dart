part of 'latihan_soal_lines_speaking_cubit.dart';

@freezed
class LatihanSoalLinesSpeakingState with _$LatihanSoalLinesSpeakingState {
  const factory LatihanSoalLinesSpeakingState.initial() = _Initial;
  const factory LatihanSoalLinesSpeakingState.loading() = _Loading;
  const factory LatihanSoalLinesSpeakingState.loaded(LatihanLinesResponseModel data) = _Loaded;
  const factory LatihanSoalLinesSpeakingState.error(String message) = _Error;
}
