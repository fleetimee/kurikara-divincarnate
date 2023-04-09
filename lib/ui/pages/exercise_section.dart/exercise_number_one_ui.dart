import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/auth/user/user_cubit.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_soal/master_soal_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import 'package:flutter_huixin_app/cubit/soal/latihan_soal_lines/latihan_soal_lines_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/exercise_section.dart/exercise_number_two_ui.dart';
import 'package:flutter_huixin_app/ui/pages/home/home_ui.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/question_data.dart';
import '../../../cubit/soal/finish_latihan_soal/finish_latihan_soal_cubit.dart';
import '../../../data/models/latihan_soal/requests/finish_soal_request_model.dart';
import '../../../data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_button.dart';

class ExerciseOne extends StatefulWidget {
  static const String routeName = '/exercise_one';
  const ExerciseOne({super.key});

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne> {
  @override
  void dispose() {
    super.dispose();
  }

  DataUser? dataUser;

  @override
  void initState() {
    dataUser = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    super.initState();
  }

  bool isAnswer = false;
  String currentAnswer = '';
  Color colorAnswerA = AppColors.greyWhite;
  Color colorAnswerB = AppColors.greyWhite;
  Color colorAnswerC = AppColors.greyWhite;
  Color colorAnswerD = AppColors.greyWhite;

  void setAnswer(String answer) {
    isAnswer = true;
    currentAnswer = answer;
    switch (answer) {
      case 'a':
        colorAnswerA = AppColors.greenColor;
        colorAnswerB = AppColors.greyWhite;
        colorAnswerC = AppColors.greyWhite;
        colorAnswerD = AppColors.greyWhite;
        break;
      case 'b':
        colorAnswerA = AppColors.greyWhite;
        colorAnswerB = AppColors.greenColor;
        colorAnswerC = AppColors.greyWhite;
        colorAnswerD = AppColors.greyWhite;
        break;
      case 'c':
        colorAnswerA = AppColors.greyWhite;
        colorAnswerB = AppColors.greyWhite;
        colorAnswerC = AppColors.greenColor;
        colorAnswerD = AppColors.greyWhite;
        break;
      case 'd':
        colorAnswerA = AppColors.greyWhite;
        colorAnswerB = AppColors.greyWhite;
        colorAnswerC = AppColors.greyWhite;
        colorAnswerD = AppColors.greenColor;
        break;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MasterSoalCubit>().state;
    final latihanHeaderState = context.watch<LatihanSoalHeaderCubit>().state;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Exercise',
        numberOfExercises: state.maybeMap(
          orElse: () => '0',
          loaded: (state) => '${state.index + 1}',
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            const SizedBox(height: 16),
            state.maybeWhen(
                orElse: () => const SizedBox(),
                loaded: (data, index, isNext) {
                  final currentSoal = data.data![index];
                  return Expanded(
                      child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(32),
                        child: Text(
                          currentSoal.soalTitle ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setAnswer('a');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswerA,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.pgJawabanA ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer('b');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswerB,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.pgJawabanB ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setAnswer('c');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswerC,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.pgJawabanC ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer('d');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswerD,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.pgJawabanD ?? '',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: state.maybeMap(
          orElse: () => 'NEXT',
          loading: (state) => 'LOADING',
          loaded: (state) => state.isNext ? 'NEXT' : 'FINISH',
        ),
        color: isAnswer
            ? state.maybeMap(
                orElse: () => AppColors.bottom,
                loaded: (state) =>
                    state.isNext ? AppColors.bottom : AppColors.greenColor,
              )
            : AppColors.greyWhite,
        onTap: isAnswer
            ? () {
                state.maybeMap(
                  orElse: () {},
                  loaded: (state) {
                    context
                        .read<LatihanSoalLinesCubit>()
                        .postLatihanSoalLines(LatihanLinesRequestModel(
                          id_log_soal_header: latihanHeaderState.maybeMap(
                            orElse: () => '',
                            loaded: (state) =>
                                state.data.data!.idLogSoalHeader.toString(),
                          ),
                          id_soal: state.data.data![state.index].idSoal!,
                          tipe: 'pilihan_ganda',
                          pg_answer: currentAnswer,
                          cocok_answer: '',
                          status: state.data.data![state.index].pgResult! ==
                              currentAnswer,
                          user_id: dataUser!.userId!,
                        ));
                    if (state.isNext) {
                      context.read<MasterSoalCubit>().nextContent();
                    } else {
                      context.read<FinishLatihanSoalCubit>().finishLatihanSoal(
                            FinishSoalRequestModel(
                              user_id: dataUser!.userId!,
                              id_level: latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idLevel.toString(),
                              ),
                              id_group_materi: latihanHeaderState.maybeMap(
                                orElse: () => '',
                                loaded: (state) =>
                                    state.data.data!.idGroupMateri.toString(),
                              ),
                            ),
                          );
                      context.read<MasterSoalCubit>().setInitial();
                      context.read<LatihanSoalHeaderCubit>().setInitial();
                      context.read<LatihanSoalLinesCubit>().setInitial();
                      Navigator.pushNamed(context, HomePage.routeName);
                    }
                  },
                );
              }
            : () {},
      ),
    );
  }
}
