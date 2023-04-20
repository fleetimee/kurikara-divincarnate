import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/models/materi_pelajaran/loging_header_response_model.dart';

import '../../../data/datasources/materi_speaking_datasource.dart';

part 'loging_header_speaking_cubit.freezed.dart';
part 'loging_header_speaking_state.dart';

class LogingHeaderSpeakingCubit extends Cubit<LogingHeaderSpeakingState> {
  final MateriSpeakingDatasource _materiDatasource;
  LogingHeaderSpeakingCubit(
    this._materiDatasource,
  ) : super(const LogingHeaderSpeakingState.initial());

  Future<void> postLogingHeader(LogingHeaderRequestModel model) async {
    emit(const LogingHeaderSpeakingState.loading());
    final result = await _materiDatasource.postLogingHeader(model);
    result.fold(
      (l) => emit(LogingHeaderSpeakingState.error(l)),
      (r) => emit(LogingHeaderSpeakingState.loaded(r)),
    );
  }

  setInitial() {
    emit(const LogingHeaderSpeakingState.initial());
  }
}
