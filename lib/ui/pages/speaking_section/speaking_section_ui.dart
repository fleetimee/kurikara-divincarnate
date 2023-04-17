import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/common/constants/color.dart';
import 'package:flutter_huixin_app/cubit/entities/speaking_course.dart';
import 'package:flutter_huixin_app/ui/widgets/appbar/appbar_style.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_button.dart';

class SpeakingSection extends StatefulWidget {
  static const String routeName = '/speaking_section';

  const SpeakingSection({super.key});

  @override
  State<SpeakingSection> createState() => _SpeakingSectionState();
}

class _SpeakingSectionState extends State<SpeakingSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarReading(
        title: 'Speaking',
        context: context,
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 10,
                        offset: const Offset(0, 8),
                        spreadRadius: -3,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      "assets/images/chinese-people.png",
                      height: 250,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                  itemCount: allSpeaking.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 80,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "assets/images/volume_reading.png",
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      allSpeaking[index].title,
                                      style: const TextStyle(
                                        fontSize: 36,
                                        color: AppColors.orangeColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      allSpeaking[index].subtitle,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        color: AppColors.orangeColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/microphone.png",
                                  fit: BoxFit.fill,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Speak',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.yellowColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: Colors.green,
        onTap: () {},
      ),
    );
  }
}
