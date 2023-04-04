import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'registers_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.loaded(AuthResponseModel data) = _Loaded;
  const factory RegisterState.error(String message) = _Error;
}
