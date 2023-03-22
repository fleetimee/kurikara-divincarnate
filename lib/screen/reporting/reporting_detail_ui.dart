import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/data/stats.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

import '../../app/theme/theme_text.dart';

class ReportingDetailPage extends StatelessWidget {
  const ReportingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReading(
        title: 'Reporting 1A',
        context: context,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Statistics',
                  style: ThemeText.textTheme3
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              const Statistics(),
              Text('Education',
                  style: ThemeText.textTheme3
                      .copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 100,
                  ),
                  itemCount: allEducations.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              bottom: 30,
                              left: 90,
                              child: SizedBox(
                                width: 300,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  child: LinearProgressIndicator(
                                    value: allEducations[index].percentage,
                                    backgroundColor: Colors.grey.shade200,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      AppColors.greenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              allEducations[index].imageUrl,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              allEducations[index].title,
                              style: ThemeText.textTheme4,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 160,
                              ),
                              child: Text(
                                allEducations[index].value,
                                style: ThemeText.textTheme5
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Statistics extends StatelessWidget {
  const Statistics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          crossAxisSpacing: 12,
          mainAxisSpacing: 20,
        ),
        itemCount: allStats.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    allStats[index].imageUrl,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allStats[index].value,
                          style: ThemeText.textTheme6,
                        ),
                        Text(
                          allStats[index].title,
                          style: ThemeText.textTheme7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
