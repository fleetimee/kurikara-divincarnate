import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_huixin_app/ui/pages/speaking_exercise/speaking_exercise_ui.dart';
import 'package:flutter_huixin_app/ui/pages/speaking_section/speaking_section_ui.dart';

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
        // GestureDetector(
        //   onTap: () {
        //     Navigator.pushNamed(
        //       context,
        //       SpeakingSection.routeName,
        //     );
        //   },
        //   child: Image.asset(
        //     "assets/images/speaking.png",
        //     height: 175,
        //     fit: BoxFit.contain,
        //   ),
        // ),
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              SpeakingExercise.routeName,
            );
          },
          child: Image.asset(
            "assets/images/speaking_exercise.png",
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
