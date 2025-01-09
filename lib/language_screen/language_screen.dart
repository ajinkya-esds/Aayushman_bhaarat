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
  List<String> languageList = ["English", "Hindi", "Marathi", "Gujrati", "Odiya", "Kannada", "Bengali", "Telugu"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new, size: 20)),
        title: Text(
          "Select Language",
          style: GoogleFonts.mitr(color: appbarTitleColor, fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffF79D25).withOpacity(0.2)),
              child: Text(
                "Select your preferred language for a personalized experience.You can always change it later!",
                textAlign: TextAlign.center,
                style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 14),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {
                      selectedLanguage = languageList[index];
                      setState(() {});
                    },
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: selectedLanguage == languageList[index] ? primaryColor.withOpacity(0.2) : Colors.transparent,
                            border:
                                Border.all(color: selectedLanguage == languageList[index] ? primaryColor : primaryColor.withOpacity(0.4), width: selectedLanguage == languageList[index] ? 2 : 0.6)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              languageList[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(color: selectedLanguage == languageList[index] ? Colors.black : Colors.grey, fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            Radio<String>(
                              value: languageList[index],
                              groupValue: selectedLanguage,
                              activeColor: primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  selectedLanguage = value!;
                                });
                              },
                            )
                          ],
                        )),
                  );
                },
                itemCount: languageList.length,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => const WelcomeScreen()));
        },
        child: Container(
          height: 52,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: primaryColor),
          child: Text(
            "Next",
            style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
