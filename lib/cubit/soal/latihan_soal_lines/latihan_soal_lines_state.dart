part of 'latihan_soal_lines_cubit.dart';

@freezed
class LatihanSoalLinesState with _$LatihanSoalLinesState {
  const factory LatihanSoalLinesState.initial() = _Initial;
  const factory LatihanSoalLinesState.loading() = _Loading;
  const factory LatihanSoalLinesState.loaded(LatihanLinesResponseModel data) = _Loaded;
  const factory LatihanSoalLinesState.error(String message) = _Error;
}
