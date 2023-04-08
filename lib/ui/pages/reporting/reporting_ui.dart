import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';
import 'package:flutter_huixin_app/data/datasources/local/app_secure_storage.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/reporting/components/reporting_ui_report_tile.dart';
import 'package:shimmer/shimmer.dart';

import '../../widgets/appbar/appbar_style.dart';
import '../../widgets/navigator_style.dart';

class ReportingPage extends StatefulWidget {
  static const String routeName = '/reporting';
  const ReportingPage({super.key});

  @override
  State<ReportingPage> createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
  DataUser? user;

  @override
  void initState() {
    super.initState();

    _getUser();
  }

  void _getUser() async {
    user = await AppSecureStorage.getUser();

    setState(() {
      context.read<ReportCubit>().getReportList(user?.userId ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: "Reporting",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 64,
                ),
                child: BlocBuilder<ReportCubit, ReportState>(
                  builder: (context, state) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        crossAxisSpacing: 48,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: state.maybeMap(
                        orElse: () => 12,
                        loaded: (state) => state.data.data?.length ?? 0,
                      ),
                      itemBuilder: (context, index) {
                        return state.when(
                          initial: () {
                            return null;
                          },
                          loading: () {
                            return const ReportTileLoading();
                          },
                          loaded: (data) {
                            return ReportTile(
                              index: index,
                              reportName: data.data?[index].name ?? '',
                              reportImage: data.data?[index].imgFile ?? '',
                              state: state,
                            );
                          },
                          error: (message) {
                            return Text(message);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigatorBar(
        currentIndex: 1,
      ),
    );
  }
}

class ReportTileLoading extends StatelessWidget {
  const ReportTileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.whiteColor5,
            width: 4,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lock_black.png',
              width: 50,
              height: 50,
            ),
            const Text(
              'A',
              style: TextStyle(
                fontSize: 35,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
