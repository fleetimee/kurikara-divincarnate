import 'package:flutter/material.dart';
import 'package:huixinapp/widget/AppBar/appbar_style.dart';

class ReadingSection extends StatefulWidget {
  const ReadingSection({super.key});

  @override
  State<ReadingSection> createState() => _ReadingSectionState();
}

class _ReadingSectionState extends State<ReadingSection> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  bool _isVolumeClicked = false;
  bool _isMicrophoneClicked = false;
  // ignore: prefer_final_fields
  bool _isReadyForNextContent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarHome(title: 'Reading Section'),
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
                            child: Container(
                              height: 350,
                              width: 350,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: _isReadyForNextContent == true
                                    ? const Color(0xFFE1DEDE)
                                    : const Color(0xFFE6E6E6),
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
                              child: const Center(
                                child: Text(
                                  "你好",
                                  style: TextStyle(
                                      fontSize: 64, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 320,
                            left: 320,
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
                            children: const [
                              Text(
                                "Nǐ hǎo",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Halo",
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
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
                                              color: Color(0xFFC1F7CE),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    "Correct \nAnswer",
                                                    style: TextStyle(
                                                      fontSize: 36,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
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
                              ? const Center(
                                  child: Text(
                                    'nice!',
                                    style: TextStyle(
                                      fontSize: 64,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.green,
                                    ),
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
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFD79F00),
                                      ),
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
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomAppBar(
            color: _isReadyForNextContent
                ? const Color(0xFF2AD352)
                : const Color(0xFFCACACA),
            child: const SizedBox(
              height: 70,
              child: Center(
                child: Text(
                  "NEXT",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
