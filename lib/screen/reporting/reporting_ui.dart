import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

import '../../data/reporting_data.dart';
import '../../widget/navigator_style.dart';

class ReportingPage extends StatelessWidget {
  const ReportingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        title: "Reporting",
      ),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.8,
        child: GridView.count(
          crossAxisCount: 2, 
          children: List.generate(12, (index) {
            return Center(
              child: 
                GestureDetector(
                onTap: () {
                      reportingData[index].isUnlocked == true
                          ? Navigator.pushNamed(
                              context, reportingData[index].routeName)
                          : null;
                    },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.borderform, width: 3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          reportingData[index].imageUrl,
                        ),
                        const SizedBox(width: 8),
                        Text(reportingData[index].numberReporting),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(reportingData[index].classReporting),
                      ],
                    ),
                  ),
                ),
                
            );
          }),
        ),
      ),
      bottomNavigationBar: const NavigatorBar(),
    );
  }
}
