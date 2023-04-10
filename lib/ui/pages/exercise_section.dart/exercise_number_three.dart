import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/soal/finish_latihan_soal/finish_latihan_soal_cubit.dart';
import 'package:flutter_huixin_app/data/models/latihan_soal/requests/finish_soal_request_model.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/auth/user/user_cubit.dart';
import '../../../cubit/mastering/master_soal/master_soal_cubit.dart';
import '../../../cubit/soal/latihan_soal_header/latihan_soal_header_cubit.dart';
import '../../../cubit/soal/latihan_soal_lines/latihan_soal_lines_cubit.dart';
import '../../../data/models/auth/auth_response_model.dart';
import '../../../data/models/latihan_soal/requests/latihan_lines_request_model.dart';
import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/bottom_appbar_button.dart';
import '../home/home_ui.dart';

class ExerciseThree extends StatefulWidget {
  static const String routeName = '/exercise_three';
  const ExerciseThree({super.key});

  @override
  State<ExerciseThree> createState() => _ExerciseThreeState();
}

class _ExerciseThreeState extends State<ExerciseThree> {
  Color colorAnswer1 = AppColors.greyWhite;
  Color colorAnswer2 = AppColors.greyWhite;
  Color colorAnswer3 = AppColors.greyWhite;
  Color colorAnswer4 = AppColors.greyWhite;
  Color colorAnswer5 = AppColors.greyWhite;
  bool isAnswer1 = false;
  bool isAnswer2 = false;
  bool isAnswer3 = false;
  bool isAnswer4 = false;
  bool isAnswer5 = false;
  int currentAnswerNo = 1;
  String currentAnswer = '';

  DataUser? dataUser;

  @override
  void initState() {
    dataUser = context.read<UserCubit>().state.maybeMap(
          orElse: () => null,
          loaded: (value) => value.data,
        );
    super.initState();
  }

  bool isAllAnswer() {
    if (isAnswer1 && isAnswer2 && isAnswer3 && isAnswer4 && isAnswer5) {
      return true;
    } else {
      return false;
    }
  }

  void setAnswer(int index, String answer) {
    currentAnswer += answer;
    currentAnswerNo = index + 1;
    if (index == 1) {
      isAnswer1 = true;
      switch (answer) {
        case 'a':
          colorAnswer1 = AppColors.yellowColor2;
          break;
        case 'b':
          colorAnswer2 = AppColors.yellowColor2;
          break;
        case 'c':
          colorAnswer3 = AppColors.yellowColor2;
          break;
        case 'd':
          colorAnswer4 = AppColors.yellowColor2;
          break;
        case 'e':
          colorAnswer5 = AppColors.yellowColor2;
          break;
        default:
      }
    }
    if (index == 2) {
      isAnswer2 = true;
      switch (answer) {
        case 'a':
          colorAnswer1 = AppColors.greenColor1;
          break;
        case 'b':
          colorAnswer2 = AppColors.greenColor1;
          break;
        case 'c':
          colorAnswer3 = AppColors.greenColor1;
          break;
        case 'd':
          colorAnswer4 = AppColors.greenColor1;
          break;
        case 'e':
          colorAnswer5 = AppColors.greenColor1;
          break;
        default:
      }
    }
    if (index == 3) {
      isAnswer3 = true;
      switch (answer) {
        case 'a':
          colorAnswer1 = AppColors.purpleColor;
          break;
        case 'b':
          colorAnswer2 = AppColors.purpleColor;
          break;
        case 'c':
          colorAnswer3 = AppColors.purpleColor;
          break;
        case 'd':
          colorAnswer4 = AppColors.purpleColor;
          break;
        case 'e':
          colorAnswer5 = AppColors.purpleColor;
          break;
        default:
      }
    }
    if (index == 4) {
      isAnswer4 = true;
      switch (answer) {
        case 'a':
          colorAnswer1 = AppColors.blueColor;
          break;
        case 'b':
          colorAnswer2 = AppColors.blueColor;
          break;
        case 'c':
          colorAnswer3 = AppColors.blueColor;
          break;
        case 'd':
          colorAnswer4 = AppColors.blueColor;
          break;
        case 'e':
          colorAnswer5 = AppColors.blueColor;
          break;
        default:
      }
    }
    if (index == 5) {
      isAnswer5 = true;
      switch (answer) {
        case 'a':
          colorAnswer1 = AppColors.orangeColor;
          break;
        case 'b':
          colorAnswer2 = AppColors.orangeColor;
          break;
        case 'c':
          colorAnswer3 = AppColors.orangeColor;
          break;
        case 'd':
          colorAnswer4 = AppColors.orangeColor;
          break;
        case 'e':
          colorAnswer5 = AppColors.orangeColor;
          break;
        default:
      }
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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, bottom: 16),
              child: Text(
                'Cocokan angka berikut \ndengan benar',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            const SizedBox(height: 16),
            state.maybeWhen(
              orElse: () => const SizedBox(),
              loaded: (data, index, isNext) {
                final currentSoal = data.data![index];
                return Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.yellowColor2,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                currentSoal.cocokSoal1 ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer(currentAnswerNo, 'a');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswer1,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.cocokJawabA ?? '',
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
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.greenColor1,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                currentSoal.cocokSoal2 ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer(currentAnswerNo, 'b');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswer2,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.cocokJawabB ?? '',
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
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.purpleColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                currentSoal.cocokSoal3 ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer(currentAnswerNo, 'c');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswer3,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.cocokJawabC ?? '',
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
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.blueColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                currentSoal.cocokSoal4 ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer(currentAnswerNo, 'd');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswer4,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.cocokJawabD ?? '',
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
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 180,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.orangeColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                currentSoal.cocokSoal5 ?? '',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          GestureDetector(
                            onTap: () {
                              setAnswer(currentAnswerNo, 'e');
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              width: 180,
                              height: 100,
                              decoration: BoxDecoration(
                                color: colorAnswer5,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  currentSoal.cocokJawabE ?? '',
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
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: state.maybeMap(
          orElse: () => 'NEXT',
          loading: (state) => 'LOADING',
          loaded: (state) => state.isNext ? 'NEXT' : 'FINISH',
        ),
        color: isAllAnswer()
            ? state.maybeMap(
                orElse: () => AppColors.bottom,
                loaded: (state) =>
                    state.isNext ? AppColors.bottom : AppColors.greenColor,
              )
            : AppColors.greyWhite,
        onTap: isAllAnswer()
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
                          tipe: state.data.data![state.index].tipe!,
                          pg_answer: '',
                          cocok_answer: currentAnswer,
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
                      Navigator.pushReplacementNamed(
                          context, HomePage.routeName);

                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.success(
                          message:
                              "Latihan berhasil diselesaikan, silahkan cek hasil latihan kamu di menu reporting",
                        ),
                      );
                    }
                  },
                );
              }
            : () {},
      ),
    );
  }
}
