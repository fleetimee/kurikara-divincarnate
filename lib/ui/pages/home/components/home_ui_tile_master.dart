import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/mastering/master_level/master_level_cubit.dart';

class TileMasterLevel extends StatelessWidget {
  final int index;
  final String levelName;
  final String levelImageUrl;
  final String levelImage;
  final MasterLevelState state;

  const TileMasterLevel({
    super.key,
    required this.index,
    required this.levelName,
    required this.levelImage,
    required this.levelImageUrl,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        state.maybeMap(
          orElse: () => null,
          loaded: (state) {
            if (index == 0) {
              Navigator.pushNamed(context, '/course_selector', arguments: {
                'level_id': state.data.data![index].idLevel,
              });
            }
          },
        );
      },
      child: Card(
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: state.maybeMap(
                  orElse: () => null,
                  loaded: (state) {
                    if (index == 0) {
                      return Container(
                        color: AppColors.bottom,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  levelName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Image.network(
                                  'https://huixin.id/assets/level/$levelImage',
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
                      return (state.data.data![index].reportReading!
                                  .isNotEmpty ||
                              state
                                  .data.data![index].reportSpeaking!.isNotEmpty)
                          ? Container(
                              color: AppColors.bottom,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        levelName,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Image.network(
                                        'https://huixin.id/assets/level/$levelImage',
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
          ]
              .animate(interval: 100.ms)
              .fadeIn(duration: 200.ms, delay: 400.ms)
              .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
              .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
        ),
      ),
    );
  }
}
