import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_screen/home_screen.dart';

class BottombarWidget extends StatelessWidget {
  BottombarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (ctx, page, child) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 46),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => selectedIndex.value = 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("asset/home.svg", height: 24, width: 24, color: page == 0 ? const Color(0xff3A63ED) : Colors.grey),
                          Text(
                            "Home",
                            style: GoogleFonts.lato(color: page == 0 ? const Color(0xff3A63ED) : Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => selectedIndex.value = 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset("asset/alert.svg", height: 24, width: 24, color: page == 1 ? const Color(0xff3A63ED) : Colors.grey),
                          Text(
                            "Alerts",
                            style: GoogleFonts.lato(color: page == 1 ? const Color(0xff3A63ED) : Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -25,
                child: Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: const CircleBorder(),
                    child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('asset/abha_logo.png', height: 45, width: 65, fit: BoxFit.contain),
                        ))),
              ),
            ],
          );
        });
  }
}
