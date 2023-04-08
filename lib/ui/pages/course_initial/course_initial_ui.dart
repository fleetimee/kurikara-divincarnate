import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_materi/master_materi_cubit.dart';
import 'package:flutter_huixin_app/cubit/materi/loging_header/loging_header_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/reading_section/reading_section_ui.dart';

import '../../../data/models/materi_pelajaran/requests/loging_header_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_note.dart';

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
    // final state = context.watch<LogingHeaderCubit>().state;
    // state.maybeMap(
    //   orElse: () {},
    //   loading: (value) {},
    //   loaded: (value) {
    //     final readingMateri = ReadingMateri(
    //         masterGroupMateri: masterGroupMateri,
    //         logingHeaderId: value.data.data!.idLogMateriHeader.toString());
    //     Navigator.pushNamed(
    //       context,
    //       ReadingSection.routeName,
    //       arguments: readingMateri,
    //     );
    //   },
    //   error: (value) {},
    // );
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
              left: MediaQuery.of(context).size.width / 12,
              child: Image.asset(
                "assets/images/tree.png",
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 30,
              right: MediaQuery.of(context).size.width / 11,
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
        InkWell(
          onTap: () {},
          child: masterGroupMateri.statusExercise == 'finish'
              ? Image.asset(
                  "assets/images/exercise_remedial.png",
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  "assets/images/exercise.png",
                  fit: BoxFit.fill,
                ),
        ),
      ],
    );
  }
}
