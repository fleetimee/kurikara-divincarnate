import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/register/registers_state.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/register_request_model.dart';

class AuthCubit extends Cubit<RegisterState> {
  final AuthDataSource _authDataSource;
  AuthCubit(
    this._authDataSource,
  ) : super(const RegisterState.initial());

  Future<void> register(RegisterRequestModel model) async {
    emit(const RegisterState.loading());
    final result = await _authDataSource.register(model);
    result.fold(
      (l) => emit(RegisterState.error(l)),
      (r) => emit(RegisterState.loaded(r)),
    );
  }
}
