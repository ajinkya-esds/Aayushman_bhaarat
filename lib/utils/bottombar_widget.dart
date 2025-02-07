import 'package:aayushman_bhaarat/bhashini/bhashini_screeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen/home_screen.dart';

class BottombarWidget extends StatelessWidget {
  BottombarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)), border: Border.all(color: Colors.grey.shade200, width: 2)),
      child: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: (ctx, page, child) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => selectedIndex.value = 0,
                  child: Column(
                    children: [
                      SvgPicture.asset("asset/home.svg", height: 24, width: 24, color: page == 0 ? const Color(0xff3A63ED) : Colors.grey),
                      const SizedBox(height: 2),
                      Text(
                        "Home",
                        style: GoogleFonts.lato(color: page == 0 ? const Color(0xff3A63ED) : Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selectedIndex.value = 2;
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BhashiniScreeen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(64), color: const Color(0xff3A63ED)),
                    child: Row(
                      children: [
                        const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.mic, color: Color(0xff3A63ED))),
                        const SizedBox(width: 6),
                        Text(
                          "Tap to ask",
                          style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => selectedIndex.value = 1,
                  child: Column(
                    children: [
                      SvgPicture.asset("asset/alert.svg", height: 24, width: 24, color: page == 1 ? const Color(0xff3A63ED) : Colors.grey),
                      const SizedBox(height: 2),
                      Text(
                        "Alerts",
                        style: GoogleFonts.lato(color: page == 1 ? const Color(0xff3A63ED) : Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
