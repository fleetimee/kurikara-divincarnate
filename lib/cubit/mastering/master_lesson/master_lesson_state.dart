part of 'master_lesson_cubit.dart';

@freezed
class MasterLessonState with _$MasterLessonState {
  const factory MasterLessonState.initial() = _Initial;
  const factory MasterLessonState.loading() = _Loading;
  const factory MasterLessonState.loaded(MasterLessonResponseModel data) =
      _Loaded;
  const factory MasterLessonState.error(String message) = _Error;
}
