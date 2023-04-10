import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/utils/uuid_gen.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/firebase_datasource.dart';
import 'package:intl/intl.dart';

import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/auth/requests/register_request_model.dart';

part 'register_apple_cubit.freezed.dart';
part 'register_apple_state.dart';

class RegisterAppleCubit extends Cubit<RegisterAppleState> {
  AuthDataSource authDataSource;
  FirebaseDataSource firebaseDataSource;
  RegisterAppleCubit(
    this.authDataSource,
    this.firebaseDataSource,
  ) : super(const RegisterAppleState.initial());

  Future<void> registerWithApple() async {
    emit(const RegisterAppleState.loading());
    final result = await firebaseDataSource.loginWithAppleId();
    result.fold(
      (l) => emit(RegisterAppleState.error(l)),
      (uid) async {
        final request = RegisterRequestModel(
          full_name: uid,
          user_name: uid,
          user_password: '123456',
          token_device: UUIDGenerator.generateUUID(),
          no_member: uid,
          birth_date: DateFormat('yyyy-MM-dd', 'id').format(DateTime.now()),
          id_apple: uid,
          email: uid,
          no_telpon: uid,
        );
        final authResponse = await authDataSource.registerSosmed(request);
        authResponse.fold(
          (l) => emit(RegisterAppleState.error(l)),
          (r) => emit(RegisterAppleState.loaded(r)),
        );
      },
    );
  }
}
