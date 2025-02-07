import 'package:aayushman_bhaarat/bhashini/bhashini_listen.dart';
import 'package:aayushman_bhaarat/utils/bottombar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appbar_widget.dart';
import '../utils/drawer_widget.dart';

class BhashiniScreeen extends StatefulWidget {
  const BhashiniScreeen({super.key});

  @override
  State<BhashiniScreeen> createState() => _BhashiniScreeenState();
}

class _BhashiniScreeenState extends State<BhashiniScreeen> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      bottomNavigationBar: BottombarWidget(),
      appBar: AppbarWidget(scaffoldKey: _sKey),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Image.asset("asset/bhashini_dr.png", width: 293, height: 293, fit: BoxFit.fill, filterQuality: FilterQuality.low),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              textAlign: TextAlign.center,
              "Share your concern with us! We're here to listen, support, and help you with any questions or issues you may have. Your well-being is our priority.",
              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BhashiniListen()));
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xff3A63ED))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(backgroundColor: Color(0xff3A63ED), radius: 14, child: Icon(Icons.mic, color: Colors.white, size: 18)),
                  const SizedBox(width: 6),
                  Text(
                    "Tap to speak",
                    style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
