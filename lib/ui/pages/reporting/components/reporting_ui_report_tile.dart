import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';

class ReportTile extends StatelessWidget {
  final int index;
  final String reportName;
  final ReportState state;
  final String reportImage;

  const ReportTile({
    super.key,
    required this.index,
    required this.reportName,
    required this.state,
    required this.reportImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (reportingData[index].isUnlocked) {
        //   Navigator.pushNamed(
        //     context,
        //     reportingData[index].routeName,
        //   );
        // }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: AppColors.whiteColor5,
            width: 4,
          ),
        ),
        child: Center(
          child: state.maybeMap(
            orElse: () => null,
            loaded: (state) {
              if (state.data.data![index].reportReading!.isNotEmpty ||
                  state.data.data![index].reportSpeaking!.isNotEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://huixin.id/assets/level/$reportImage',
                      width: 50,
                      height: 50,
                    ),
                    Text(
                      reportName,
                      style: const TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/lock_black.png',
                    width: 50,
                    height: 50,
                  ),
                  Text(
                    reportName,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
