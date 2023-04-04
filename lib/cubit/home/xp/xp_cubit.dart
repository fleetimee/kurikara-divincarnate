import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/home_datasource.dart';

import '../../../data/models/get_xp_response_model.dart';

part 'xp_cubit.freezed.dart';
part 'xp_state.dart';

class XpCubit extends Cubit<XpState> {
  final HomeDatasource _homeDatasource;
  XpCubit(
    this._homeDatasource,
  ) : super(const XpState.initial());

  Future<void> getXp(String userId) async {
    emit(const XpState.loading());
    final result = await _homeDatasource.getXp(userId);
    result.fold(
      (l) => emit(XpState.error(l)),
      (r) => emit(XpState.loaded(r)),
    );
  }
}
