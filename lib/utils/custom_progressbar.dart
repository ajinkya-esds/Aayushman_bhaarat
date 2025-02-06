import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress; // Progress value between 0 and 1

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 20,
      decoration: BoxDecoration(color: Color(0xffC2CFF9), borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: [
          Container(
            width: 250 * progress, // Width based on progress
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff3A63ED), Color(0xff085997)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
