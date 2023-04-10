import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/utils/uuid_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/firebase_datasource.dart';
import 'package:intl/intl.dart';

import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/auth/requests/login_request_model.dart';
import '../../../data/models/auth/requests/register_request_model.dart';

part 'login_apple_cubit.freezed.dart';
part 'login_apple_state.dart';

class LoginAppleCubit extends Cubit<LoginAppleState> {
  AuthDataSource authDataSource;
  FirebaseDataSource firebaseDataSource;
  LoginAppleCubit(
    this.authDataSource,
    this.firebaseDataSource,
  ) : super(const LoginAppleState.initial());

  Future<void> loginWithApple() async {
    emit(const LoginAppleState.loading());
    final result = await firebaseDataSource.loginWithAppleId();
    result.fold(
      (l) => emit(LoginAppleState.error(l)),
      (uid) async {
        final request = LoginRequestModel(
          username: uid,
          password: '123456',
          id_apple: uid,
        );
        final authResponse = await authDataSource.login(request);
        authResponse.fold(
          (l) => emit(LoginAppleState.error(l)),
          (r) => emit(LoginAppleState.loaded(r)),
        );
      },
    );
  }
}
