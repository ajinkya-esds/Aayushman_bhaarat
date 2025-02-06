import 'package:aayushman_bhaarat/questionarrie/question_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LifestyleQuestion extends StatefulWidget {
  const LifestyleQuestion({super.key});

  @override
  State<LifestyleQuestion> createState() => _LifestyleQuestionState();
}

class _LifestyleQuestionState extends State<LifestyleQuestion> {
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
          title: Text(
            textAlign: TextAlign.center,
            "Lifestyle Questioner",
            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Image.asset("asset/question1.png", height: 292, width: 292, fit: BoxFit.cover)),
          const SizedBox(height: 12),
          Text(
            textAlign: TextAlign.center,
            "Hi Pranav,",
            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              textAlign: TextAlign.center,
              "Answer a few quick questions about your daily habits and lifestyle to receive personalized health insights.",
              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => const QuestionList()));
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
