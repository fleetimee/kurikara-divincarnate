part of 'delete_user_cubit.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _Initial;
  const factory DeleteUserState.loading() = _Loading;
  const factory DeleteUserState.loaded(AuthResponseModel response) = _Loaded;
  const factory DeleteUserState.error(String message) = _Error;
}
