import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:shimmer/shimmer.dart';

class TileMasterLevelLoading extends StatelessWidget {
  const TileMasterLevelLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  '..',
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
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  color: AppColors.bottom,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '..',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/images/progress_bar.png',
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
