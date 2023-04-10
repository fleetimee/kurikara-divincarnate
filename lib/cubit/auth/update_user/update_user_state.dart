part of 'update_user_cubit.dart';

@freezed
class UpdateUserState with _$UpdateUserState {
  const factory UpdateUserState.initial() = _Initial;
  const factory UpdateUserState.loading() = _Loading;
  const factory UpdateUserState.loaded(AuthResponseModel response) = _Loaded;
  const factory UpdateUserState.error(String message) = _Error;
}
