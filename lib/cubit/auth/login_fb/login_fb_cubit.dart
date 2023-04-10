import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/utils/uuid_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/firebase_datasource.dart';
import 'package:intl/intl.dart';

import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/auth/requests/login_request_model.dart';
import '../../../data/models/auth/requests/register_request_model.dart';

part 'login_fb_cubit.freezed.dart';
part 'login_fb_state.dart';

class LoginFbCubit extends Cubit<LoginFbState> {
  AuthDataSource authDataSource;
  FirebaseDataSource firebaseDataSource;
  LoginFbCubit(
    this.authDataSource,
    this.firebaseDataSource,
  ) : super(const LoginFbState.initial());

  // Future<void> registerWithFb() async {
  //   emit(const LoginFbState.loading());
  //   final result = await firebaseDataSource.loginWithFacebook();
  //   result.fold(
  //     (l) => emit(LoginFbState.error(l)),
  //     (uid) async {
  //       final request = RegisterRequestModel(
  //         full_name: uid,
  //         user_name: uid,
  //         user_password: '123456',
  //         token_device: UUIDGenerator.generateUUID(),
  //         no_member: uid,
  //         birth_date: DateFormat('yyyy-MM-dd', 'id').format(DateTime.now()),
  //         id_fb: uid,
  //         email: uid,
  //         no_telpon: uid,
  //       );
  //       final authResponse = await authDataSource.registerSosmed(request);
  //       authResponse.fold(
  //         (l) => emit(LoginFbState.error(l)),
  //         (r) => emit(LoginFbState.loaded(r)),
  //       );
  //     },
  //   );
  // }

  // Future<void> loginWithFb() async {
  //   emit(const LoginFbState.loading());
  //   final result = await firebaseDataSource.loginWithFacebook();
  //   result.fold(
  //     (l) => emit(LoginFbState.error(l)),
  //     (uid) async {
  //       final request = LoginRequestModel(
  //         username: uid,
  //         password: '123456',
  //         id_fb: uid,
  //       );
  //       final authResponse = await authDataSource.login(request);
  //       authResponse.fold(
  //         (l) => emit(LoginFbState.error(l)),
  //         (r) => emit(LoginFbState.loaded(r)),
  //       );
  //     },
  //   );
  // }
}
