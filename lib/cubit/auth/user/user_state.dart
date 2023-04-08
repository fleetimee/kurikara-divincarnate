part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loaded(DataUser data, String tokenApi) = _Loaded;
}
