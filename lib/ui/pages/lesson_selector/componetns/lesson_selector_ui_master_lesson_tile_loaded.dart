import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/entities/lesson_selector.dart';

class MasterLessonTile extends StatelessWidget {
  final int index;

  const MasterLessonTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Insert route in here
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: allLessonSelector[index].isUnlocked == true
            ? Container(
                color: AppColors.bottom,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          allLessonSelector[index].day,
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          allLessonSelector[index].logoUrl,
                          height: 70,
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
              ),
      ),
    );
  }
}
