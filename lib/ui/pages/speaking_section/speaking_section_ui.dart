import 'package:flutter/material.dart';
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
      body: const Center(
        child: Text('Speaking Section'),
      ),
      bottomNavigationBar: BottomNavigationBarButton(
        name: 'NEXT',
        color: Colors.green,
        onTap: () {},
      ),
    );
  }
}
