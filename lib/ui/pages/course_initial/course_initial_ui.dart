import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal/master_soal_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/loging_header/loging_header_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/reading_section/reading_section_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../cubit/mastering/master_materi/master_materi_cubit.dart';
import '../../../data/models/latihan_soal/requests/latihan_header_request_model.dart';
import '../../../data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';
import '../exercise_section.dart/exercise_page.dart';

class CourseInitial extends StatefulWidget {
  static const String routeName = '/course_initial';

  const CourseInitial({super.key});

  @override
  State<CourseInitial> createState() => _CourseInitialState();
}

class _CourseInitialState extends State<CourseInitial> {
  DataUser? user;
  MasterGroupMateri? masterGroupMateri;

  @override
  void initState() {
    super.initState();
    user = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
  }

  @override
  Widget build(BuildContext context) {
    masterGroupMateri =
        ModalRoute.of(context)!.settings.arguments as MasterGroupMateri;
    return Scaffold(
      appBar: AppBarCourse(
        title: masterGroupMateri?.name ?? '..',
        progression: '0/14',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: MateriSelector(
            masterGroupMateri: masterGroupMateri!,
            dataUser: user!,
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBarWithNotes(),
    );
  }
}

class MateriSelector extends StatelessWidget {
  final MasterGroupMateri masterGroupMateri;
  final DataUser dataUser;

  const MateriSelector({
    Key? key,
    required this.masterGroupMateri,
    required this.dataUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Image.asset(
              "assets/images/container.png",
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 15,
              left: MediaQuery.of(context).size.width * 0.11,
              // child: Image.asset(
              //   "assets/images/tree.png",
              //   height: 100,
              //   fit: BoxFit.fill,
              // ),
              child: CachedNetworkImage(
                imageUrl:
                    'https://huixin.id/assets/group_materi/${masterGroupMateri.imgFile}',
                imageBuilder: (context, imageProvider) => Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 30,
              right: MediaQuery.of(context).size.width * 0.12,
              child: Text(
                '${masterGroupMateri.name}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 70,
              right: MediaQuery.of(context).size.width / 30,
              child: Image.asset(
                "assets/images/progress_bar.png",
                height: 25,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
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
                "assets/images/reading.png",
                fit: BoxFit.fill,
              ),
            );
          },
        ),
        const SizedBox(height: 16),
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
            return InkWell(
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
                      "assets/images/exercise.png",
                      fit: BoxFit.fill,
                    ),
            );
          },
        ),
      ],
    );
  }
}
