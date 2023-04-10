part of 'register_google_cubit.dart';

@freezed
class RegisterGoogleState with _$RegisterGoogleState {
  const factory RegisterGoogleState.initial() = _Initial;
  const factory RegisterGoogleState.loading() = _Loading;
  const factory RegisterGoogleState.loaded(AuthResponseModel data) = _Loaded;
  const factory RegisterGoogleState.error(String message) = _Error;
}
