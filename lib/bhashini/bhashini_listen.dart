import 'package:aayushman_bhaarat/utils/bottombar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appbar_widget.dart';
import '../utils/drawer_widget.dart';

class BhashiniListen extends StatefulWidget {
  const BhashiniListen({super.key});

  @override
  State<BhashiniListen> createState() => _BhashiniListenState();
}

class _BhashiniListenState extends State<BhashiniListen> {
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
              "Please give me home remedies for cough and cold",
              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.graphic_eq, color: Colors.white, size: 24),
                const SizedBox(width: 6),
                Text(
                  "Analyzing",
                  style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Image.asset("asset/transcribe.png", width: double.maxFinite, height: 75, fit: BoxFit.fill, filterQuality: FilterQuality.low),
        ],
      ),
    );
  }
}
