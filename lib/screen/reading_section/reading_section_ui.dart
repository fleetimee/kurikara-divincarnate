import 'package:flutter/material.dart';
import 'package:huixinapp/app/const/color.dart';
import 'package:huixinapp/app/theme/theme_text.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';
import 'package:huixinapp/widget/bottom_appbar_button.dart';
import 'package:huixinapp/widget/container_course.dart';

class ReadingSection extends StatefulWidget {
  const ReadingSection({super.key});

  @override
  State<ReadingSection> createState() => _ReadingSectionState();
}

class _ReadingSectionState extends State<ReadingSection> {
  bool _isVolumeClicked = false;
  bool _isMicrophoneClicked = false;
  bool _isReadyForNextContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarReading(
          title: 'Reading & Speaking',
          context: context,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Center(
                            child: ContainerCourse(
                              text: '你好',
                              color: _isReadyForNextContent == true
                                  ? AppColors.whiteColor4
                                  : Colors.white,
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2 - 200,
                            right: MediaQuery.of(context).size.width / 2 - 190,
                            child: GestureDetector(
                              onTap: () => setState(() {
                                _isVolumeClicked = !_isVolumeClicked;
                                debugPrint(_isVolumeClicked.toString());
                              }),
                              child: Image.asset(
                                "assets/images/volume_reading.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _isVolumeClicked,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Nǐ hǎo",
                                style: ThemeText.textTheme8,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Halo",
                                style: ThemeText.textTheme8,
                              ),
                            ],
                          ),
                          _isReadyForNextContent
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Center(
                                      child: Image.asset(
                                        "assets/images/check.png",
                                        width: 120.0,
                                        height: 120.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                )
                              : _isMicrophoneClicked
                                  ? Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Center(
                                          child: Container(
                                            height: 110,
                                            width: 350,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              color:AppColors.lightGreen,
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Correct \nAnswer",
                                                    style: ThemeText.textTheme9,
                                                  ),
                                                  const SizedBox(
                                                    width: 25,
                                                  ),
                                                  Image.asset(
                                                    "assets/images/volume_ok.png",
                                                    fit: BoxFit.fill,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    )
                                  : const SizedBox(
                                      height: 100,
                                    ),
                          _isReadyForNextContent
                              ? Center(
                                  child: Text(
                                    'nice!',
                                    style: ThemeText.textTheme10,
                                  ),
                                )
                              : Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () => setState(() {
                                        _isMicrophoneClicked = true;
                                        debugPrint(
                                            _isMicrophoneClicked.toString());
                                      }),
                                      onDoubleTap: () => setState(() {
                                        if (_isMicrophoneClicked == true) {
                                          _isReadyForNextContent = true;
                                        }
                                      }),
                                      child: Image.asset(
                                        "assets/images/microphone.png",
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      _isMicrophoneClicked
                                          ? 'Speak Again'
                                          : 'Speak',
                                      style: ThemeText.textTheme11
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarButton(
          name: "NEXT",
          color: _isReadyForNextContent
              ? AppColors.greenColor
              : AppColors.greyWhite,
          onTap: () {
            // perform action on button click
          },
        ));
  }
}
