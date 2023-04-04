part of 'loging_header_cubit.dart';

@freezed
class LogingHeaderState with _$LogingHeaderState {
  const factory LogingHeaderState.initial() = _Initial;
  const factory LogingHeaderState.loading() = _Loading;
  const factory LogingHeaderState.loaded(LogingHeaderResponseModel data) = _Loaded;
  const factory LogingHeaderState.error(String message) = _Error;
}
