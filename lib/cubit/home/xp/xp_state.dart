part of 'xp_cubit.dart';

@freezed
class XpState with _$XpState {
  const factory XpState.initial() = _Initial;
  const factory XpState.loading() = _Loading;
  const factory XpState.loaded(GetXpResponseModel data) = _Loaded;
  const factory XpState.error(String message) = _Error;
}
