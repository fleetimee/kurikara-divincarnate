import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_huixin_app/cubit/mastering/master_materi/master_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal/master_soal_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/loging_header/loging_header_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/latihan_header_request_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_page.dart';
import 'package:flutter_huixin_app/ui/pages/reading_section/reading_section_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ReadingTile extends StatelessWidget {
  final MasterGroupMateri masterGroupMateri;
  final DataUser dataUser;

  const ReadingTile({
    super.key,
    required this.masterGroupMateri,
    required this.dataUser,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocConsumer<LogingHeaderCubit, LogingHeaderState>(
          listener: (context, state) {
            state.maybeMap(
                orElse: () {},
                loaded: (value) {
                  context.read<MasterMateriCubit>().setInitial();
                  final readingMateri = ReadingMateri(
                      masterGroupMateri: masterGroupMateri,
                      logingHeaderId:
                          value.data.data!.idLogMateriHeader.toString());
                  Navigator.pushNamed(
                    context,
                    ReadingSection.routeName,
                    arguments: readingMateri,
                  );
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
                    .read<LogingHeaderCubit>()
                    .postLogingHeader(LogingHeaderRequestModel(
                      user_id: dataUser.userId!,
                      id_level: masterGroupMateri.idLevel!,
                      id_group_materi: masterGroupMateri.idGroupMateri!,
                    ));
              },
              child: Image.asset(
                "assets/images/reading_revision.png",
                height: 175,
                fit: BoxFit.contain,
              ),
            );
          },
        ),
        BlocConsumer<LatihanSoalHeaderCubit, LatihanSoalHeaderState>(
          listener: (context, state) {
            state.maybeMap(
                orElse: () {},
                loaded: (value) {
                  context.read<MasterSoalCubit>().setInitial();
                  final readingMateri = ReadingMateri(
                      masterGroupMateri: masterGroupMateri,
                      logingHeaderId:
                          value.data.data!.idLogSoalHeader.toString());
                  Navigator.pushNamed(
                    context,
                    ExercisePage.routeName,
                    arguments: readingMateri,
                  );
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
                if (masterGroupMateri.statusReading == 'finish') {
                  context
                      .read<LatihanSoalHeaderCubit>()
                      .postLatihanSoalHeader(LatihanHeaderRequestModel(
                        user_id: dataUser.userId!,
                        id_level: masterGroupMateri.idLevel!,
                        id_group_materi: masterGroupMateri.idGroupMateri!,
                      ));
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message:
                          "Please complete the reading section before doing the exercise, thank you.",
                    ),
                  );
                }
              },
              child: masterGroupMateri.statusReading == 'finish'
                  ? Image.asset(
                      "assets/images/exercise_remedial.png",
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      "assets/images/reading_exercise.png",
                      height: 180,
                      fit: BoxFit.contain,
                    ),
            );
          },
        ),
      ],
    );
  }
}
