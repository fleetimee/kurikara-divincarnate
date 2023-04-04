import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_huixin_app/data/datasources/report_datasource.dart';
import 'package:flutter_huixin_app/data/models/report/report_list_response_model.dart';

part 'report_cubit.freezed.dart';
part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  final ReportDatasource _reportDatasource;
  ReportCubit(
    this._reportDatasource,
  ) : super(const ReportState.initial());

  Future<void> getReportList(String userId) async {
    emit(const ReportState.loading());
    final result = await _reportDatasource.getReportList(userId);
    result.fold(
      (l) => emit(ReportState.error(l)),
      (r) => emit(ReportState.loaded(r)),
    );
  }
}
