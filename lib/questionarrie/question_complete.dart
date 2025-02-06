import 'package:aayushman_bhaarat/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionComplete extends StatefulWidget {
  const QuestionComplete({super.key});

  @override
  State<QuestionComplete> createState() => _QuestionCompleteState();
}

class _QuestionCompleteState extends State<QuestionComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("asset/question_complete.png", height: 292, width: 292, fit: BoxFit.cover)),
          const SizedBox(height: 12),
          Text(
            textAlign: TextAlign.center,
            "Thank you Pranav, ",
            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              textAlign: TextAlign.center,
              "Thank you for sharing your feedback! Your input helps us improve and provide a better personalized health insights.",
              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
        },
        child: Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Text(
            "Continue",
            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
