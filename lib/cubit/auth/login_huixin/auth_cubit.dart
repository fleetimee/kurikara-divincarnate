import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_fcm_request_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_profile_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/login_request_model.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthDataSource _authDataSource;
  AuthCubit(
    this._authDataSource,
  ) : super(const AuthState.initial());

  Future<void> login(LoginRequestModel model) async {
    emit(const AuthState.loading());
    final result = await _authDataSource.login(model);
    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => emit(AuthState.loaded(r)),
    );
  }

  Future<void> updateProfile(UpdateProfileRequestModel model) async {
    emit(const AuthState.loading());
    final result = await _authDataSource.updateProfile(model);
    result.fold(
      (l) => emit(AuthState.error(l)),
      (r) => emit(AuthState.loaded(r)),
    );
  }

  Future<void> updateFcm(UpdateFcmRequestModel model) async {
    // emit(const AuthState.loading());
    // ignore: unused_local_variable
    final result = await _authDataSource.updateFcm(model);
    // result.fold(
    //   (l) => emit(AuthState.error(l)),
    //   (r) => emit(AuthState.loaded(r)),
    // );
  }
}
