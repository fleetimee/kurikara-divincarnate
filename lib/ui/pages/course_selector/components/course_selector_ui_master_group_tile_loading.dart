import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:shimmer/shimmer.dart';

class MasterGroupMateriTileLoading extends StatelessWidget {
  const MasterGroupMateriTileLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.whiteColor,
      child: Column(
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Card(
                elevation: 0,
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
                            'fleetime',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/images/lock_black.png',
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
