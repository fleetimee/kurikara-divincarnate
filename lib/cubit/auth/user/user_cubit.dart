import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/auth/auth_response_model.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial());

  void setUser(DataUser user, String tokenApi) {
    emit(UserState.loaded(user, tokenApi));
  }

  void clearUser() {
    emit(const UserState.initial());
  }
}
