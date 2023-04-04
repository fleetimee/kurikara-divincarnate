part of 'loging_lines_cubit.dart';

@freezed
class LogingLinesState with _$LogingLinesState {
  const factory LogingLinesState.initial() = _Initial;
  const factory LogingLinesState.loading() = _Loading;
  const factory LogingLinesState.loaded(LogingLinesResponseModel data) = _Loaded;
  const factory LogingLinesState.error(String message) = _Error;
}
