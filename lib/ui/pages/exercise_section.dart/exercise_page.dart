import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal/master_soal_cubit.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_one_ui.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_three.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_two_ui.dart';

import '../../../cubit/auth/user/user_cubit.dart';
import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/mastering/master_group_materi_response_model.dart';

class ExercisePage extends StatefulWidget {
  static const String routeName = '/exercise_page';
  const ExercisePage({super.key});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  DataUser? dataUser;
  ReadingMateri? readingMateri;

  @override
  void initState() {
    dataUser = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    readingMateri = ModalRoute.of(context)!.settings.arguments as ReadingMateri;
    final state = context.watch<MasterSoalCubit>().state;
    return state.maybeMap(
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
      initial: (_) {
        context.read<MasterSoalCubit>().getMasterSoal(
              dataUser!.userId!,
              readingMateri!.masterGroupMateri.idLevel!,
              readingMateri!.masterGroupMateri.idGroupMateri!,
            );
        return const SizedBox();
      },
      loaded: ((value) {
        if (value.data.data == null || value.data.data!.isEmpty) {
          return const Center(
            child: Text('Belum ada soal'),
          );
        }
        final listSoal = value.data.data!;
        final currentSoal = listSoal[value.index];
        if (currentSoal.tipe == 'pilihan_ganda') {
          return const ExerciseOne();
        }

        if (currentSoal.tipe == 'voice') {
          return const ExerciseTwo();
        }

        if (currentSoal.tipe == 'mencocokan') {
          return const ExerciseThree();
        }

        return const Center(
          child: Text('Tidak ada data'),
        );
      }),
    );
  }
}
