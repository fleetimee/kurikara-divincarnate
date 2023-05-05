import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/soal_speaking/latihan_soal_header_speaking/latihan_soal_header_speaking_cubit.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_header_request_model.dart';

import 'package:flutter_huixin_app/ui/pages/speaking_exercise/speaking_exercise_ui.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_section/speaking_section_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../cubit/materi/loging_header_speaking/loging_header_speaking_cubit.dart';
import '../../../../data/models/auth/auth_response_model.dart';
import '../../../../data/models/mastering/master_group_materi_response_model.dart';
import '../../../../data/models/materi_pelajaran/requests/loging_header_request_model.dart';

class SpeakingTile extends StatelessWidget {
  final MasterGroupMateri masterGroupMateri;
  final DataUser dataUser;
  const SpeakingTile({
    Key? key,
    required this.masterGroupMateri,
    required this.dataUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocConsumer<LogingHeaderSpeakingCubit, LogingHeaderSpeakingState>(
          listener: (context, state) {
            state.maybeMap(
                orElse: () {},
                loaded: (value) {
                  final readingMateri = ReadingMateri(
                      masterGroupMateri: masterGroupMateri,
                      logingHeaderId:
                          value.data.data!.idLogMateriHeader.toString());
                  Navigator.pushNamed(
                    context,
                    SpeakingSection.routeName,
                    arguments: readingMateri,
                  );
                  context.read<LogingHeaderSpeakingCubit>().setInitial();
                });
          },
          builder: (context, state) {
            state.maybeMap(
              orElse: () {},
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            return GestureDetector(
              onTap: () {
                context
                    .read<LogingHeaderSpeakingCubit>()
                    .postLogingHeader(LogingHeaderRequestModel(
                      user_id: dataUser.userId!,
                      id_level: masterGroupMateri.idLevel!,
                      id_group_materi: masterGroupMateri.idGroupMateri!,
                      id_lesson: masterGroupMateri.idLesson!,
                    ));
              },
              child: Image.asset(
                "assets/images/speaking.png",
                height: 175,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        BlocConsumer<LatihanSoalHeaderSpeakingCubit,
            LatihanSoalHeaderSpeakingState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () {},
              loaded: (value) {
                final readingMateri = ReadingMateri(
                    masterGroupMateri: masterGroupMateri,
                    logingHeaderId:
                        value.data.data!.idLogSoalHeader.toString());
                Navigator.pushNamed(
                  context,
                  SpeakingExercise.routeName,
                  arguments: readingMateri,
                );
                context.read<LatihanSoalHeaderSpeakingCubit>().setInitial();
              },
            );
          },
          builder: (context, state) {
            state.maybeMap(
              orElse: () {},
              loading: (value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            return GestureDetector(
              onTap: () {
                if (masterGroupMateri.statusExerciseSpeaking != 'lock') {
                  context
                      .read<LatihanSoalHeaderSpeakingCubit>()
                      .postLatihanSoalHeader(LatihanHeaderRequestModel(
                        user_id: dataUser.userId!,
                        id_level: masterGroupMateri.idLevel!,
                        id_group_materi: masterGroupMateri.idGroupMateri!,
                        id_lesson: masterGroupMateri.idLesson!,
                      ));
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message:
                          "Please complete the speaking section before doing the exercise, thank you.",
                    ),
                  );
                }
              },
              child: masterGroupMateri.statusExerciseSpeaking != 'lock'
                  ? Image.asset(
                      "assets/images/speaking_exercise_open.png",
                      height: 175,
                      fit: BoxFit.contain,
                    )
                  : Image.asset(
                      "assets/images/speaking_exercise.png",
                      height: 175,
                      fit: BoxFit.contain,
                    ),
            );
          },
        ),
      ],
    );
  }
}
