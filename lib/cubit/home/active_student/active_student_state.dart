part of 'active_student_cubit.dart';

@freezed
class ActiveStudentState with _$ActiveStudentState {
  const factory ActiveStudentState.initial() = _Initial;
  const factory ActiveStudentState.loading() = _Loading;
  const factory ActiveStudentState.loaded(GetActiveStudentResponseModel data) = _Loaded;
  const factory ActiveStudentState.error(String message) = _Error;
}
