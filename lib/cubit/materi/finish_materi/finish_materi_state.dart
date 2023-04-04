part of 'finish_materi_cubit.dart';

@freezed
class FinishMateriState with _$FinishMateriState {
  const factory FinishMateriState.initial() = _Initial;
  const factory FinishMateriState.loading() = _Loading;
  const factory FinishMateriState.loaded(bool data) = _Loaded;
  const factory FinishMateriState.error(String message) = _Error;
}
