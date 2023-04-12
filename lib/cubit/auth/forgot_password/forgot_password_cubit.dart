import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/forgot_password_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.dart';
part 'forgot_password_cubit.freezed.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthDataSource _authDataSource;

  ForgotPasswordCubit(this._authDataSource)
      : super(const ForgotPasswordState.initial());

  Future<void> forgotPassword(ForgotPasswordRequestModel model) async {
    emit(const ForgotPasswordState.loading());
    final result = await _authDataSource.forgotPassword(model);
    result.fold(
      (l) => emit(ForgotPasswordState.error(l)),
      (r) => emit(ForgotPasswordState.loaded(r)),
    );
  }
}
