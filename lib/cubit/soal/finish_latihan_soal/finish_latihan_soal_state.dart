part of 'finish_latihan_soal_cubit.dart';

@freezed
class FinishLatihanSoalState with _$FinishLatihanSoalState {
  const factory FinishLatihanSoalState.initial() = _Initial;
  const factory FinishLatihanSoalState.loading() = _Loading;
  const factory FinishLatihanSoalState.loaded(bool data) = _Loaded;
  const factory FinishLatihanSoalState.error(String message) = _Error;
}
