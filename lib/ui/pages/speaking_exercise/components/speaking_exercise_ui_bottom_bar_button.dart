import 'package:flutter/material.dart';
import 'package:flutter_huixin_app/ui/widgets/bottom_appbar_button.dart';

class SpeakingExerciseBottomNavBar extends StatelessWidget {
  const SpeakingExerciseBottomNavBar({
    super.key,
    required this.name,
    required this.color,
    required this.onTap,
  });

  final String name;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarButton(
      color: color,
      name: name,
      onTap: onTap,
    );
  }
}
