import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/home_datasource.dart';
import '../../../data/models/get_daily_activity_response_model.dart';

part 'daily_activity_cubit.freezed.dart';
part 'daily_activity_state.dart';

class DailyActivityCubit extends Cubit<DailyActivityState> {
  final HomeDatasource _homeDatasource;
  DailyActivityCubit(
    this._homeDatasource,
  ) : super(const DailyActivityState.initial());

  Future<void> getDailyActivity(String userId) async {
    emit(const DailyActivityState.loading());
    final result = await _homeDatasource.getDailyActivity(userId);
    result.fold(
      (l) => emit(DailyActivityState.error(l)),
      (r) => emit(DailyActivityState.loaded(r)),
    );
  }
}
