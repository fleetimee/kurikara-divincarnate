import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/materi_pelajaran/loging_lines_response_model.dart';

part 'loging_lines_state.dart';
part 'loging_lines_cubit.freezed.dart';

class LogingLinesCubit extends Cubit<LogingLinesState> {
  LogingLinesCubit() : super(LogingLinesState.initial());
}
