import 'package:flutter/material.dart';

import '../../../common/constants/color.dart';
import '../../../cubit/entities/stats.dart';
import '../../widgets/appbar/appbar_style.dart';

class ReportingDetailPage extends StatefulWidget {
  static const String routeName = '/reporting_detail';
  const ReportingDetailPage({super.key});

  @override
  State<ReportingDetailPage> createState() => _ReportingDetailPageState();
}

class _ReportingDetailPageState extends State<ReportingDetailPage> {
  Map? args;
  bool _argsLoaded = false;

  Future<void> _getArgs() async {
    args = (await Future.delayed(Duration.zero, () {
      return ModalRoute.of(context)?.settings.arguments as Map?;
    }))!;
    setState(() {
      _argsLoaded = true;
    });
    debugPrint('$args');
  }

  @override
  void initState() {
    _getArgs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String title = _argsLoaded ? (args?['name'] ?? '..') : 'Loading...';
    int index = _argsLoaded ? (args?['index'] ?? 0) : 0;

    print('index: $index');

    return Scaffold(
      appBar: AppBarReading(
        title: title,
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
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Statistics(),
              const Text(
                'Education',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
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
                                child: TweenAnimationBuilder(
                                  tween: Tween<double>(
                                      begin: 0,
                                      end: allEducations[index].percentage),
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOut,
                                  builder: (context, value, child) {
                                    // return ClipRRect(
                                    //   borderRadius: const BorderRadius.all(
                                    //       Radius.circular(10)),
                                    //   child: LinearProgressIndicator(
                                    //     value: allEducations[index].percentage,
                                    //     backgroundColor: Colors.grey.shade200,
                                    //     valueColor:
                                    //         const AlwaysStoppedAnimation<Color>(
                                    //       AppColors.greenColor,
                                    //     ),
                                    //   ),
                                    // );
                                    return Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        FractionallySizedBox(
                                          widthFactor: value,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.greenColor,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  // child: ClipRRect(
                                  //   borderRadius: const BorderRadius.all(
                                  //       Radius.circular(10)),
                                  //   child: LinearProgressIndicator(
                                  //     value: allEducations[index].percentage,
                                  //     backgroundColor: Colors.grey.shade200,
                                  //     valueColor:
                                  //         const AlwaysStoppedAnimation<Color>(
                                  //       AppColors.greenColor,
                                  //     ),
                                  //   ),
                                  // ),
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
                              style: const TextStyle(
                                fontSize: 28,
                                color: Colors.black,
                              ),
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
                                style: const TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
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
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          allStats[index].title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
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
