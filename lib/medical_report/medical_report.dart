import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/bottombar_widget.dart';

class MedicalReportScreen extends StatefulWidget {
  const MedicalReportScreen({super.key});

  @override
  State<MedicalReportScreen> createState() => _MedicalReportScreenState();
}

class _MedicalReportScreenState extends State<MedicalReportScreen> {
  final historyDetails = {
    "heart_info": [
      {"title": "Heart Rate", "rate": "72 BPM", "heart_condition": "Stable", "icon": "asset/stethescope.png"},
      {"title": "Blood Pressure", "rate": "135/85 mmHg", "heart_condition": "Slightly Elevated", "icon": "asset/heart-rate 2.png"},
      {"title": "Medications", "rate": "Amlodipine (Daily 2)", "heart_condition": "For Blood Pressure Control", "icon": "asset/tablet.png"},
      {"title": "Recent Hospital Visit", "rate": "Visit for BP Spike", "heart_condition": "24 December 2024", "icon": ""},
      {"title": "Doctor’s Advice", "rate": "Regular Monitoring, reduce salt intake", "heart_condition": "For Blood Pressure Control", "icon": "asset/dr_advice.png"}
    ],
    "body_health": [
      {"title": "Blood Sugar Level", "rate": "98 mg/dL", "heart_condition": "Normal", "icon": "asset/body_blood.png"},
      {"title": "Current Health", "rate": "Mild Seasonal Allergies", "heart_condition": "Need to Improve", "icon": "asset/activity.png"},
      {"title": "Medications", "rate": "Antihistamines (Daily 2)", "heart_condition": "For Allergies", "icon": "asset/tablet.png"},
      {"title": "Allergies", "rate": "Pollen, Peanuts", "heart_condition": "Cause Sneezing and Mild reactons", "icon": "asset/asthma.png"},
      {"title": "Vaccinations", "rate": "", "heart_condition": "December 2024", "icon": ""}
    ]
  };
  ValueNotifier<int> selectedPage = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(textAlign: TextAlign.center, "Medical Report", style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24)),
      ),
      bottomNavigationBar: BottombarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 131,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(colors: [Color(0xff08599733), Color(0xff3A63EDEB)], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  border: Border.all(color: Colors.grey.shade300)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Discover your health\nimprovement with",
                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                      children: [
                        TextSpan(text: "\nAyushman Bharat", style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 20)),
                      ],
                    ),
                  ),
                  Image.asset("asset/abha_logo.png", height: 74, width: 105, fit: BoxFit.fill)
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 85,
              child: ValueListenableBuilder(
                  valueListenable: selectedPage,
                  builder: (ctx, page, child) {
                    return ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectedPage.value = 0;
                          },
                          child: Container(
                            height: 81,
                            width: 94,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xff3A63ED)),
                              gradient: page == 0 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: page == 0 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                                  ),
                                  child: Image.asset("asset/heart_rate.png", height: 24, width: 24, color: page == 0 ? Colors.white : const Color(0xff3A63ED)),
                                ),
                                Text("Heart", style: GoogleFonts.lato(color: page == 0 ? Colors.white : Colors.black, fontWeight: FontWeight.w700, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedPage.value = 1;
                          },
                          child: Container(
                            height: 81,
                            width: 94,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xff3A63ED)),
                              gradient: page == 1 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: page == 1 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                                  ),
                                  child: Image.asset("asset/lifestyle.png", height: 24, width: 24, color: page == 1 ? Colors.white : const Color(0xff3A63ED)),
                                ),
                                Text("LifeStyle", style: GoogleFonts.lato(color: page == 1 ? Colors.white : Colors.black, fontWeight: FontWeight.w700, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedPage.value = 2;
                          },
                          child: Container(
                            height: 81,
                            width: 94,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xff3A63ED)),
                              gradient: page == 2 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: page == 2 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                                  ),
                                  child: Image.asset("asset/sleep.png", height: 24, width: 24, color: page == 2 ? Colors.white : const Color(0xff3A63ED)),
                                ),
                                Text("Sleep", style: GoogleFonts.lato(color: page == 2 ? Colors.white : Colors.black, fontWeight: FontWeight.w700, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedPage.value = 3;
                          },
                          child: Container(
                            height: 81,
                            width: 94,
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: const Color(0xff3A63ED)),
                              gradient: page == 3 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: page == 3 ? const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight) : null,
                                  ),
                                  child: Image.asset("asset/activity.png", height: 24, width: 24, color: page == 3 ? Colors.white : const Color(0xff3A63ED)),
                                ),
                                Text("Activity", style: GoogleFonts.lato(color: page == 3 ? Colors.white : Colors.black, fontWeight: FontWeight.w700, fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            const SizedBox(height: 12),
            ValueListenableBuilder(
                valueListenable: selectedPage,
                builder: (ctx, page, child) {
                  return page == -1
                      ? Container()
                      : Text(
                          page == 0
                              ? "All Heart Information"
                              : page == 1
                                  ? "Body Health"
                                  : page == 2
                                      ? "Sleep Conditions"
                                      : page == 3
                                          ? "Overall Lifestyle"
                                          : "",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14));
                }),
            const SizedBox(height: 12),
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: selectedPage,
                    builder: (ctx, page, child) {
                      return page == 0 || page == 1
                          ? ListView.builder(
                              itemBuilder: (ctx, index) {
                                return Container(
                                    height: 94,
                                    margin: const EdgeInsets.only(bottom: 8),
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(page == 0 ? historyDetails["heart_info"]![index]["title"] ?? "" : historyDetails["body_health"]![index]["title"] ?? "",
                                                style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16)),
                                            Text(page == 0 ? historyDetails["heart_info"]![index]["rate"] ?? "" : historyDetails["body_health"]![index]["rate"] ?? "",
                                                style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14)),
                                            Text(page == 0 ? historyDetails["heart_info"]![index]["heart_condition"] ?? "" : historyDetails["body_health"]![index]["heart_condition"] ?? "",
                                                style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w400, fontSize: 14)),
                                          ],
                                        ),
                                        if (page == 1 && (historyDetails["body_health"]![index]["icon"]?.isNotEmpty ?? false))
                                          Image.asset(historyDetails["body_health"]![index]["icon"] ?? "", height: 38, width: 38, fit: BoxFit.contain),
                                        if (page == 0 && (historyDetails["heart_info"]![index]["icon"]?.isNotEmpty ?? false))
                                          Image.asset(historyDetails["heart_info"]![index]["icon"] ?? "", height: 38, width: 38, fit: BoxFit.contain)
                                      ],
                                    ));
                              },
                              itemCount: page == 0
                                  ? historyDetails["heart_info"]!.length
                                  : page == 1
                                      ? historyDetails["body_health"]!.length
                                      : 0,
                            )
                          : Container();
                    }))
          ],
        ),
      ),
    );
  }
}
