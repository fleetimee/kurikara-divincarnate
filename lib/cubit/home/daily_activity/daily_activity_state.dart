part of 'daily_activity_cubit.dart';

@freezed
class DailyActivityState with _$DailyActivityState {
  const factory DailyActivityState.initial() = _Initial;
  const factory DailyActivityState.loading() = _Loading;
  const factory DailyActivityState.loaded(GetDailyActivityResponseModel data) = _Loaded;
  const factory DailyActivityState.error(String message) = _Error;
}
