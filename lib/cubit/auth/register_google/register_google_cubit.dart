import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/datasources/firebase_datasource.dart';
import 'package:intl/intl.dart';

import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/auth/requests/register_request_model.dart';
import '../../../utils/uuid_gen.dart';

part 'register_google_cubit.freezed.dart';
part 'register_google_state.dart';

class RegisterGoogleCubit extends Cubit<RegisterGoogleState> {
  AuthDataSource authDataSource;
  FirebaseDataSource firebaseDataSource;
  RegisterGoogleCubit(
    this.authDataSource,
    this.firebaseDataSource,
  ) : super(RegisterGoogleState.initial());

  Future<void> registerWithGoogle() async {
    emit(const RegisterGoogleState.loading());
    final result = await firebaseDataSource.loginWithGoogle();
    result.fold(
      (l) => emit(RegisterGoogleState.error(l)),
      (uid) async {
        final request = RegisterRequestModel(
          full_name: uid,
          user_name: uid,
          user_password: '123456',
          token_device: UUIDGenerator.generateUUID(),
          no_member: uid,
          birth_date: DateFormat('yyyy-MM-dd', 'id').format(DateTime.now()),
          id_google: uid,
          email: uid,
          no_telpon: uid,
        );
        final authResponse = await authDataSource.registerSosmed(request);
        authResponse.fold(
          (l) => emit(RegisterGoogleState.error(l)),
          (r) => emit(RegisterGoogleState.loaded(r)),
        );
      },
    );
  }
}
