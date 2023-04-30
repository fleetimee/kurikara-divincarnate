import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';
import 'package:flutter_huixin_app/data/models/auth/auth_response_model.dart';
import 'package:flutter_huixin_app/data/models/mastering/master_level_response_model.dart';
import 'package:flutter_huixin_app/ui/pages/course_selector/course_selector_ui.dart';
import 'package:flutter_huixin_app/ui/pages/lesson_selector/lesson_selector_ui.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TileMasterLevel extends StatelessWidget {
  final int index;
  final MasterLevel masterLevel;
  final MasterLevelState state;
  final DataUser? user;

  const TileMasterLevel({
    Key? key,
    required this.index,
    required this.masterLevel,
    required this.state,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// This function is used to select the level
    /// and navigate to the course selector page
    /// if the level is unlocked
    /// or show a dialog if the level is locked
    void selectLevel() {
      state.maybeMap(
        orElse: () => null,
        loaded: (state) {
          if (masterLevel.open && user?.noMember != '' ||
              user?.noMember == null) {
            Navigator.pushNamed(
              context,
              LessonSelectorPage.routeName,
              arguments: masterLevel,
            );
          } else {
            return (masterLevel.open && user?.noMember != '' ||
                    user?.noMember == null)
                ? Navigator.pushNamed(
                    context,
                    CourseSelector.routeName,
                    arguments: {
                      'level_id': state.data.data![index].idLevel,
                      'level_name': masterLevel.name,
                    },
                  )
                : user?.noMember == '' || user?.noMember == null
                    ? showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.error(
                          message: "Please register your number member first",
                        ),
                      )
                    : showTopSnackBar(
                        Overlay.of(context),
                        CustomSnackBar.error(
                          message:
                              "Level ${masterLevel.name} is not unlocked yet, please complete the previous level first",
                        ),
                      );
          }
        },
      );
    }

    return InkWell(
      onTap: selectLevel,
      child: Card(
        elevation: 0,
        color: AppColors.whiteColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    "assets/images/crown.png",
                    height: 10,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  const Text(
                    '1/2',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: state.maybeMap(
                  orElse: () => null,
                  loaded: (state) {
                    if (index == 0 && user?.noMember != '' ||
                        user?.noMember == null) {
                      return Container(
                        color: AppColors.bottom,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  masterLevel.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                CachedNetworkImage(
                                  imageUrl:
                                      'https://huixin.id/assets/level/${masterLevel.imgFile}',
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
                                  height: 80,
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
                    } else {
                      return (masterLevel.open && user?.noMember != '' ||
                              user?.noMember == null)
                          ? Container(
                              color: AppColors.bottom,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        masterLevel.name ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      CachedNetworkImage(
                                        imageUrl:
                                            'https://huixin.id/assets/level/${masterLevel.imgFile}',
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(
                                            color: AppColors.yellowColor,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(
                                          Icons.error,
                                          color: AppColors.yellowColor,
                                        ),
                                        height: 80,
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
                            )
                          : Container(
                              color: AppColors.whiteColor2,
                              child: Center(
                                child: Image.asset(
                                  "assets/images/lock.png",
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
