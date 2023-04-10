import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/delete_user_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.dart';
part 'delete_user_cubit.freezed.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  final AuthDataSource _authDataSource;

  DeleteUserCubit(this._authDataSource)
      : super(const DeleteUserState.initial());

  Future<void> deleteUser(DeleteUserRequestModel model) async {
    emit(const DeleteUserState.loading());
    final result = await _authDataSource.deleteUser(model);
    result.fold(
      (l) => emit(DeleteUserState.error(l)),
      (r) => emit(DeleteUserState.loaded(r)),
    );
  }
}
