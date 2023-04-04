part of 'report_cubit.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.loading() = _Loading;
  const factory ReportState.loaded(ReportListResponseModel data) = _Loaded;
  const factory ReportState.error(String message) = _Error;
}
