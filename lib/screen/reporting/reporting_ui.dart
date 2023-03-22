import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/data/reporting_data.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/navigator_style.dart';

import '../../app/theme/theme_text.dart';

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});

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
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2,
                    crossAxisSpacing: 48,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: reportingData.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (reportingData[index].isUnlocked) {
                          Navigator.pushNamed(
                            context,
                            reportingData[index].routeName,
                          );
                        }
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                reportingData[index].isUnlocked
                                    ? reportingData[index].imageUrl
                                    : 'assets/images/lock_black.png',
                                width: 50,
                                height: 50,
                              ),
                              Text(
                                reportingData[index].classReporting,
                                style: ThemeText.textTheme3,
                              ),
                            ],
                          ),
                        ),
                      ),
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
