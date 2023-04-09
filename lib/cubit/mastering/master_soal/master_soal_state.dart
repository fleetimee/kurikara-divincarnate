part of 'master_soal_cubit.dart';

@freezed
class MasterSoalState with _$MasterSoalState {
  const factory MasterSoalState.initial() = _Initial;
  const factory MasterSoalState.loading() = _Loading;
  const factory MasterSoalState.loaded(
    MasterSoalResponseModel data,
    int index,
    bool isNext,
  ) = _Loaded;
  const factory MasterSoalState.error(String message) = _Error;
}
