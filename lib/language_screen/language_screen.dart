import 'package:aayushman_bhaarat/utils/color_scheme.dart';
import 'package:aayushman_bhaarat/welcome_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = "English";
  List<Map<String, String>> languageList = [
    {"title": "English", "subtitle": "A"},
    {"title": "Hindi", "subtitle": "ए"},
    {"title": "Marathi", "subtitle": "अ"},
    {"title": "Gujrati", "subtitle": "અ"},
    {"title": "Odiya", "subtitle": "ଓ"},
    {"title": "Malayalam", "subtitle": "എ"},
    {"title": "Tamil", "subtitle": "அ"},
    {"title": "Kannada", "subtitle": "ಅ"},
    {"title": "Bengali", "subtitle": "ক"},
    {"title": "Telugu", "subtitle": "அ"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new, size: 20)),
        title: Text(
          "Select Language",
          style: GoogleFonts.lato(color: appbarTitleColor, fontWeight: FontWeight.w700, fontSize: 24),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 16, top: 2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey)),
                child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Language",
                    suffixIcon: const Icon(Icons.search_rounded),
                    hintStyle: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 2, childAspectRatio: 1.4),
                  itemCount: languageList.length, // Number of items
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          selectedLanguage = languageList[index]['title']!;
                          setState(() {});
                        },
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: selectedLanguage == languageList[index]['title']!
                                    ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)
                                    : null,
                                // color: selectedLanguage == languageList[index]['title']! ? primaryColor.withOpacity(0.2) : Colors.transparent,
                                border: selectedLanguage != languageList[index]['title']! ? Border.all(color: Colors.grey, width: selectedLanguage == languageList[index]['title'] ? 2 : 0.6) : null),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  languageList[index]['title'] ?? "",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(color: selectedLanguage != languageList[index]['title']! ? Colors.black : Colors.white, fontWeight: FontWeight.w700, fontSize: 14),
                                ),
                                Center(
                                  child: Text(
                                    languageList[index]['subtitle'] ?? "",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(color: selectedLanguage != languageList[index]['title']! ? Colors.black : Colors.white, fontWeight: FontWeight.w400, fontSize: 48),
                                  ),
                                ),
                              ],
                            )));
                  },
                ),
              ),
            ],
          )),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const WelcomeScreen()));
        },
        child: Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
          child: Text(
            "Get Started",
            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
