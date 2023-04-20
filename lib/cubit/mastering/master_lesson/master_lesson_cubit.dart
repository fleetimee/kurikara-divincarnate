import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/mastering_datasource.dart';
import '../../../data/models/mastering/master_lesson_response_model.dart';

part 'master_lesson_cubit.freezed.dart';
part 'master_lesson_state.dart';

class MasterLessonCubit extends Cubit<MasterLessonState> {
  final MasteringDatasource _masteringDatasource;
  MasterLessonCubit(
    this._masteringDatasource,
  ) : super(const MasterLessonState.initial());

  Future<void> getMasterLesson(
    String userId,
    String levelId,
  ) async {
    emit(const MasterLessonState.loading());
    final result = await _masteringDatasource.getMasterLesson(
      userId,
      levelId,
    );
    result.fold(
      (l) => emit(MasterLessonState.error(l)),
      (r) => emit(MasterLessonState.loaded(r)),
    );
  }
}
