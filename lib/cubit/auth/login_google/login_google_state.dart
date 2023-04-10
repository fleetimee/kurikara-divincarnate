part of 'login_google_cubit.dart';

@freezed
class LoginGoogleState with _$LoginGoogleState {
  const factory LoginGoogleState.initial() = _Initial;
  const factory LoginGoogleState.loading() = _Loading;
  const factory LoginGoogleState.loaded(AuthResponseModel data) = _Loaded;
  const factory LoginGoogleState.error(String message) = _Error;
}
