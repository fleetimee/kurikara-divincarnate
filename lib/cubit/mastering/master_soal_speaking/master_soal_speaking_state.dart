part of 'master_soal_speaking_cubit.dart';

@freezed
class MasterSoalSpeakingState with _$MasterSoalSpeakingState {
  const factory MasterSoalSpeakingState.initial() = _Initial;
  const factory MasterSoalSpeakingState.loading() = _Loading;
  const factory MasterSoalSpeakingState.loaded(
    MasterSoalResponseModel data,
    int index,
    bool isNext,
  ) = _Loaded;
  const factory MasterSoalSpeakingState.error(String message) = _Error;
}
