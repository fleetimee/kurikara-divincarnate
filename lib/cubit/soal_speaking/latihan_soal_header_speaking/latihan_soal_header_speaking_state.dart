part of 'latihan_soal_header_speaking_cubit.dart';

@freezed
class LatihanSoalHeaderSpeakingState with _$LatihanSoalHeaderSpeakingState {
  const factory LatihanSoalHeaderSpeakingState.initial() = _Initial;
  const factory LatihanSoalHeaderSpeakingState.loading() = _Loading;
  const factory LatihanSoalHeaderSpeakingState.loaded(LatihanHeaderResponseModel data) = _Loaded;
  const factory LatihanSoalHeaderSpeakingState.error(String message) = _Error;
}
