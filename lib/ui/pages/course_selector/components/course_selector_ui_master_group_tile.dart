import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_group_materi/master_group_materi_cubit.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_group_materi_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/course_initial/course_initial_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MasterGroupMateriTile extends StatelessWidget {
  final int index;
  final MasterGroupMateriState state;
  final MasterGroupMateri masterGroupMateri;

  const MasterGroupMateriTile({
    Key? key,
    required this.index,
    required this.state,
    required this.masterGroupMateri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            if (masterGroupMateri.open && masterGroupMateri.openSpeaking) {
              Navigator.pushNamed(
                context,
                CourseInitial.routeName,
                arguments: masterGroupMateri,
              );
            } else {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.error(
                  message:
                      "You cannot access this course at the moment. Please complete the previous course first.",
                ),
              );
            }
          },
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: AppColors.whiteColor,
        child: Column(children: [
          Expanded(
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: state.maybeMap(
                orElse: () => null,
                loaded: (state) {
                  if (masterGroupMateri.open &&
                      masterGroupMateri.openSpeaking) {
                    return Container(
                      color: AppColors.bottom,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                masterGroupMateri.name ?? '',
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              CachedNetworkImage(
                                imageUrl:
                                    'https://huixin.id/assets/group_materi/${masterGroupMateri.imgFile}',
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.yellowColor,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.error,
                                  color: AppColors.yellowColor,
                                ),
                                height: 50,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 8),
                              Image.asset(
                                "assets/images/progress_bar.png",
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container(
                    color: AppColors.whiteColor2,
                    child: Center(
                      child: Image.asset(
                        "assets/images/lock.png",
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
