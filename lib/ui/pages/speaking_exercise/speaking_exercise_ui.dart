// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal_speaking/master_soal_speaking_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_exercise/components/speaking_exercise_ui_voice.dart';
import 'package:flutter_huixin_app/ui/widgets/not_found.dart';

class SpeakingExercise extends StatefulWidget {
  static const String routeName = '/speaking_exercise';
  const SpeakingExercise({super.key});

  @override
  State<SpeakingExercise> createState() => _SpeakingExerciseState();
}

class _SpeakingExerciseState extends State<SpeakingExercise> {
  DataUser? dataUser;
  ReadingMateri? readingMateri;

  final ScrollController _scrollController = ScrollController();

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
    readingMateri =
        ModalRoute.of(context)!.settings.arguments as ReadingMateri?;
    final state = context.watch<MasterSoalSpeakingCubit>().state;

    return state.maybeMap(
      orElse: () => const Center(
        child: CircularProgressIndicator(),
      ),
      initial: (value) {
        context.read<MasterSoalSpeakingCubit>().getMasterSoalSpeaking(
              dataUser!.userId!,
              readingMateri!.masterGroupMateri.idLevel!,
              readingMateri!.masterGroupMateri.idGroupMateri!,
            );

        // Proceed to loaded state
        return const CircularProgressIndicator();
      },
      loaded: (value) {
        if (value.data.data == null || value.data.data!.isEmpty) {
          return const NotFound(
            text: 'Soal belum tersedia',
          );
        }

        // final listSoal = value.data.data!;
        // final currentSoal = listSoal[value.index];

        return const SpeakingExerciseVoice();
      },
    );
  }
}
