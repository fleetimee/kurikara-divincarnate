import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/materi_datasource.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/loging_header_response_model.dart';

part 'loging_header_cubit.freezed.dart';
part 'loging_header_state.dart';

class LogingHeaderCubit extends Cubit<LogingHeaderState> {
  final MateriDatasource _materiDatasource;
  LogingHeaderCubit(
    this._materiDatasource,
  ) : super(const LogingHeaderState.initial());

  Future<void> postLogingHeader(LogingHeaderRequestModel model) async {
    emit(const LogingHeaderState.loading());
    final result = await _materiDatasource.postLogingHeader(model);
    result.fold(
      (l) => emit(LogingHeaderState.error(l)),
      (r) => emit(LogingHeaderState.loaded(r)),
    );
  }
}
