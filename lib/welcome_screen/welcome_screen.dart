import 'package:aayushman_bhaarat/home_screen/home_screen.dart';
import 'package:aayushman_bhaarat/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("asset/Welcome-Image.png", width: double.maxFinite, height: 320, fit: BoxFit.fill),
            const SizedBox(height: 12),
            Image.asset("asset/welcome.png", width: 38, height: 38),
            const SizedBox(height: 12),
            Text(
              "Hello Pranav!",
              textAlign: TextAlign.center,
              style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w500, fontSize: 26),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome to', style: GoogleFonts.mitr(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20)),
                const SizedBox(width: 6),
                Image.asset("asset/bhashini.png", width: 88, height: 22, fit: BoxFit.fill),
              ],
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
              },
              child: Container(
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: primaryColor),
                child: Text(
                  "Next",
                  style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
