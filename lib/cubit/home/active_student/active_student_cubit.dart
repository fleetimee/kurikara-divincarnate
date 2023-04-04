import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/home_datasource.dart';
import 'package:flutter_huixin_app/data/models/get_active_student_response_model.dart';

part 'active_student_cubit.freezed.dart';
part 'active_student_state.dart';

class ActiveStudentCubit extends Cubit<ActiveStudentState> {
  final HomeDatasource _homeDatasource;
  ActiveStudentCubit(
    this._homeDatasource,
  ) : super(const ActiveStudentState.initial());

  Future<void> getActiveStudent() async {
    emit(const ActiveStudentState.loading());
    final result = await _homeDatasource.getActiveStudent();
    result.fold(
      (l) => emit(ActiveStudentState.error(l)),
      (r) => emit(ActiveStudentState.loaded(r)),
    );
  }
}
