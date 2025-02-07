import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const AppbarWidget({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.sort, color: Colors.white)),
              Text(
                "Welcome to Bhashini",
                style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(Icons.language, color: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    "English",
                    style: GoogleFonts.lato(decoration: TextDecoration.underline, decorationColor: Colors.white, color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
