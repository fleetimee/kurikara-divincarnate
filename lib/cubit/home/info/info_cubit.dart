import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/datasources/home_datasource.dart';
import '../../../data/models/get_info_response_model.dart';

part 'info_cubit.freezed.dart';
part 'info_state.dart';

class InfoCubit extends Cubit<InfoState> {
  final HomeDatasource _homeDatasource;
  InfoCubit(
    this._homeDatasource,
  ) : super(const InfoState.initial());

  Future<void> getInfo(String userId) async {
    emit(const InfoState.loading());
    final result = await _homeDatasource.getInfo(userId);
    result.fold(
      (l) => emit(InfoState.error(l)),
      (r) => emit(InfoState.loaded(r)),
    );
  }
}
