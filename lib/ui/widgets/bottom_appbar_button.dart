import 'package:flutter/material.dart';

class BottomNavigationBarButton extends StatelessWidget {
  final String name;
  final Color color;
  final VoidCallback onTap;

  const BottomNavigationBarButton({
    super.key,
    required this.name,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: BottomAppBar(
        color: color,
        child: SizedBox(
          height: 70,
          child: Center(
            child: InkWell(
              onTap: onTap,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
