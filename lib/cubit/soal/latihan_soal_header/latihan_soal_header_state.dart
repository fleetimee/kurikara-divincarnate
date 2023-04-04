part of 'latihan_soal_header_cubit.dart';

@freezed
class LatihanSoalHeaderState with _$LatihanSoalHeaderState {
  const factory LatihanSoalHeaderState.initial() = _Initial;
  const factory LatihanSoalHeaderState.loading() = _Loading;
  const factory LatihanSoalHeaderState.loaded(LatihanHeaderResponseModel data) = _Loaded;
  const factory LatihanSoalHeaderState.error(String message) = _Error;
}
