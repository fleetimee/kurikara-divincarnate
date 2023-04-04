import 'package:bloc/bloc.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/loging_header_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'loging_header_state.dart';
part 'loging_header_cubit.freezed.dart';

class LogingHeaderCubit extends Cubit<LogingHeaderState> {
  LogingHeaderCubit() : super(LogingHeaderState.initial());
}
