import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/report/report_cubit.dart';
import 'package:flutter_huixin_app/ui/pages/reporting/reporting_detail_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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

        state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            if (state.data.data![index].reportReading!.isNotEmpty &&
                state.data.data![index].reportSpeaking!.isNotEmpty) {
              // Navigator.pushNamed(
              //   context,
              //   state.data.data![index].routeName,
              //   arguments: {
              //     'level_id': state.data.data![index].idLevel,
              //     'level_id_materi': state.data.data![index].idGroupMateri,
              //     'level_name': state.data.data![index].name,
              //   },
              // );
              Navigator.pushNamed(
                context,
                ReportingDetailPage.routeName,
                arguments: {
                  'name': state.data.data![index].name,
                  'index': index,
                },
              );
            } else {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message:
                      "Report for level ${state.data.data![index].name} is not yet available, please wait for the teacher to upload the report",
                ),
              );
            }
          },
        );
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
              if (state.data.data![index].reportReading!.isNotEmpty &&
                  state.data.data![index].reportSpeaking!.isNotEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(
                    //   'https://huixin.id/assets/level/$reportImage',
                    //   width: 50,
                    //   height: 50,
                    // ),
                    CachedNetworkImage(
                      imageUrl: 'https://huixin.id/assets/level/$reportImage',
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: AppColors.yellowColor,
                      ),
                      height: 40,
                      width: 40,
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
