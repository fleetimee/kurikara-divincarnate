part of 'loging_lines_speaking_cubit.dart';

@freezed
class LogingLinesSpeakingState with _$LogingLinesSpeakingState {
  const factory LogingLinesSpeakingState.initial() = _Initial;
  const factory LogingLinesSpeakingState.loading() = _Loading;
  const factory LogingLinesSpeakingState.loaded(LogingLinesResponseModel data) = _Loaded;
  const factory LogingLinesSpeakingState.error(String message) = _Error;
}
