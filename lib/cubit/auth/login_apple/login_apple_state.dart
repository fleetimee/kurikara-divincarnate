part of 'login_apple_cubit.dart';

@freezed
class LoginAppleState with _$LoginAppleState {
  const factory LoginAppleState.initial() = _Initial;
  const factory LoginAppleState.loading() = _Loading;
  const factory LoginAppleState.loaded(AuthResponseModel data) = _Loaded;
  const factory LoginAppleState.error(String message) = _Error;
}
