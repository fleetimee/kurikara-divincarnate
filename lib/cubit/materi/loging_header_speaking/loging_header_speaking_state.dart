part of 'loging_header_speaking_cubit.dart';

@freezed
class LogingHeaderSpeakingState with _$LogingHeaderSpeakingState {
  const factory LogingHeaderSpeakingState.initial() = _Initial;
  const factory LogingHeaderSpeakingState.loading() = _Loading;
  const factory LogingHeaderSpeakingState.loaded(LogingHeaderResponseModel data) = _Loaded;
  const factory LogingHeaderSpeakingState.error(String message) = _Error;
}
