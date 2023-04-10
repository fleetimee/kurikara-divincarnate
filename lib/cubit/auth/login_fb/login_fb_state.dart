part of 'login_fb_cubit.dart';

@freezed
class LoginFbState with _$LoginFbState {
  const factory LoginFbState.initial() = _Initial;
  const factory LoginFbState.loading() = _Loading;
  const factory LoginFbState.loaded(AuthResponseModel data) = _Loaded;
  const factory LoginFbState.error(String message) = _Error;
}
