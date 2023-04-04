import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'finish_materi_state.dart';
part 'finish_materi_cubit.freezed.dart';

class FinishMateriCubit extends Cubit<FinishMateriState> {
  FinishMateriCubit() : super(FinishMateriState.initial());
}
