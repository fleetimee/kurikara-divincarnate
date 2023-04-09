import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/cubit/home/daily_activity/daily_activity_cubit.dart';
import 'package:flutter_huixin_app/cubit/home/xp/xp_cubit.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/stats.dart';
import '../../widgets/appbar/appbar_style.dart';

class ReportingDetailPage extends StatefulWidget {
  static const String routeName = '/reporting_detail';
  const ReportingDetailPage({super.key});

  @override
  State<ReportingDetailPage> createState() => _ReportingDetailPageState();
}

class _ReportingDetailPageState extends State<ReportingDetailPage> {
  Map? args;
  DataUser? user;

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)?.settings.arguments as Map?;

    String title = args?['name'] ?? '..';
    int indexFromRoute = args?['index'] ?? 0;

    return Scaffold(
      appBar: AppBarReading(
        title: title,
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Statistics(),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () => const CircularProgressIndicator(),
                      initial: (value) {
                        context.read<ReportCubit>().getReportList(
                              user?.userId.toString() ?? '0',
                            );

                        return const CircularProgressIndicator();
                      },
                      loaded: (value) {
                        return ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 100,
                          ),
                          itemCount: allEducations.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      bottom: 30,
                                      left: 90,
                                      child: SizedBox(
                                        width: 300,
                                        height: 40,
                                        child: ProgressBar(
                                          indexFromRoute: indexFromRoute,
                                          index: index,
                                          value: value,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      allEducations[index].imageUrl,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      allEducations[index].title,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 160,
                                      ),
                                      child: Text(
                                        allEducations[index].value == '80/100'
                                            ? '${value.data.data![indexFromRoute].reportReading!.first.nilai!}/100'
                                            : '${value.data.data![indexFromRoute].reportSpeaking!.first.nilai!}/100',
                                        style: const TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final int index;
  final dynamic value;

  const ProgressBar({
    super.key,
    required this.indexFromRoute,
    required this.index,
    required this.value,
  });

  final int indexFromRoute;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: allEducations[index].percentage == 0.8
            ? int.parse(value
                    .data.data![indexFromRoute].reportReading!.first.nilai!) /
                100
            : int.parse(value
                    .data.data![indexFromRoute].reportSpeaking!.first.nilai!) /
                100,
      ),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              widthFactor: value,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
        ),
        itemCount: allStats.length,
        itemBuilder: (context, index) {
          return StatCard(stat: allStats[index]);
        },
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final dynamic stat;

  const StatCard({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Image.asset(
              stat.imageUrl,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stat.value != '13'
                        ? context.select(
                            (XpCubit xpCubit) => xpCubit.state.maybeMap(
                              orElse: () => '..',
                              loaded: (state) =>
                                  state.data.data?.first.jmlXp ?? '0',
                            ),
                          )
                        : context.select(
                            (DailyActivityCubit dailyActivityCubit) =>
                                dailyActivityCubit.state.maybeMap(
                              orElse: () => '..',
                              loaded: (state) =>
                                  state.data.data?.first.jmlDaily.toString() ??
                                  '..',
                            ),
                          ),
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    stat.title,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
