import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/datasources/auth_datasource.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/auth/requests/update_profile_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_state.dart';
part 'update_user_cubit.freezed.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  final AuthDataSource _authDataSource;

  UpdateUserCubit(this._authDataSource)
      : super(const UpdateUserState.initial());

  Future<void> updateUser(UpdateProfileRequestModel model) async {
    emit(const UpdateUserState.loading());
    final result = await _authDataSource.updateProfile(model);
    result.fold(
      (l) => emit(UpdateUserState.error(l)),
      (r) => emit(UpdateUserState.loaded(r)),
    );
  }
}
