part of 'register_apple_cubit.dart';

@freezed
class RegisterAppleState with _$RegisterAppleState {
  const factory RegisterAppleState.initial() = _Initial;
  const factory RegisterAppleState.loading() = _Loading;
  const factory RegisterAppleState.loaded(AuthResponseModel data) = _Loaded;
  const factory RegisterAppleState.error(String message) = _Error;
}
