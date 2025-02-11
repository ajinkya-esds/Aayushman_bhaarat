import 'package:aayushman_bhaarat/medical_profile/medical_profile.dart';
import 'package:aayushman_bhaarat/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../questionarrie/lifestyle_questionarrie.dart';
import '../utils/bottombar_widget.dart';
import '../utils/drawer_widget.dart';

ValueNotifier<int> selectedIndex = ValueNotifier(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();
  List<Map<String, dynamic>> myProfileList = [
    {'title': "Pranav’s Profile", "time": "Updated 2d ago", "image": "asset/Profile.png", 'color': const Color(0xff3A63ED), 'titleColor': secondaryColor},
    {'title': "Medical Info", "time": "Updated 2d ago", "image": "asset/medical_info.png", 'color': const Color(0xff3A63ED), 'titleColor': primaryColor},
    {'title': "Family Info", "time": "Updated 2d ago", "image": "asset/family_info.png", 'color': const Color(0xffC2CFF9), 'titleColor': primaryColor},
    {'title': "Lifestyle", "time": "Updated 2d ago", "image": "asset/life_info.png", 'color': const Color(0xffC2CFF9), 'titleColor': primaryColor},
  ];

  List<Map<String, dynamic>> appointmentList = [
    {"name": "Dr. Shripad Joshi", "post": "General Consultation", "date": "Tue, Feb 4", "time": "5:30 PM - 7:00 PM", "image": "asset/appointment.png"},
    {"name": "Dr. Neha Malhotra", "post": "General Consultation", "date": "Tue, Feb 4", "time": "5:30 PM - 7:00 PM", "image": "asset/appointment2.png"},
  ];
  List<Map<String, dynamic>> articleList = [
    {"title": "New Ayurvedic Medicine Shows Promising Results for Stress Relief", "time": "1d ago", "source": "VIE stories", "image": "asset/new_article.png"},
    {"title": "Ayurveda’s Role in Managing Chronic Diseases Gains Global Recognition", "time": "2d ago", "source": "Tv9 stories", "image": "asset/article2.png"},
  ];
  List<Map<String, dynamic>> soundList = [
    {"title": "Cosmic Harmony", "subtitle": "(Space Inspired)", "image": "asset/sound1.png"},
    {"title": "Raag of Stars", "subtitle": "(Sitar Serenity)", "image": "asset/sound2.png"},
    {"title": "Shanti Dhwani", "subtitle": "(Space Inspired)", "image": "asset/sound5.png"},
    {"title": "Shanti Dhwani", "subtitle": "(Space Inspired)", "image": "asset/sound4.png"}
  ];

  List<Map<String, String>> issueList = [
    {"title": "Dental Care", "image": "asset/dental_care.png"},
    {"title": "Skin & Hair", "image": "asset/skin_hair.png"},
    {"title": "Bones & Joints", "image": "asset/bones_joints.png"},
    {"title": "Shishu Care", "image": "asset/shishu_Care.png"},
    {"title": "Kidney Issue", "image": "asset/kidney_issue.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      bottomNavigationBar: BottombarWidget(),
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 330,
                child: Stack(
                  children: [
                    Container(
                      height: 145,
                      padding: const EdgeInsets.only(top: 12),
                      alignment: Alignment.topLeft,
                      decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                _sKey.currentState?.openDrawer();
                              },
                              icon: const Icon(Icons.sort, color: Colors.white)),
                          Text(
                            "Welcome Pranav",
                            style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
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
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 15,
                      right: 16,
                      top: 100,
                      child: buildMyProfileCard(),
                    )
                  ],
                ),
              ),
              Container(height: 12, width: double.maxFinite, color: Colors.grey.withOpacity(0.2)),
              SizedBox(
                  width: double.maxFinite,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "My Appointments",
                              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            Text(
                              "View all",
                              style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            text: "You have ",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                            children: [
                              TextSpan(text: "3 upcoming appointments", style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w600, fontSize: 16)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 171,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return Container(
                                height: 161,
                                width: 187,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xffC2CFF9))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(appointmentList[index]['image'] ?? "", height: 44, width: 44, fit: BoxFit.fill),
                                    const SizedBox(height: 6),
                                    Text(
                                      appointmentList[index]['name'] ?? "",
                                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      appointmentList[index]['post'] ?? "",
                                      style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                                        const SizedBox(width: 6),
                                        Text(
                                          appointmentList[index]['date'] ?? "",
                                          style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.access_time_filled_rounded, color: Colors.grey, size: 18),
                                        const SizedBox(width: 6),
                                        Text(
                                          appointmentList[index]['time'] ?? "",
                                          style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: appointmentList.length,
                          ),
                        )
                      ]))),
              Container(height: 12, width: double.maxFinite, color: Colors.grey.withOpacity(0.2)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Treating Issues",
                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Column(
                          children: [
                            Image.asset(issueList[index]['image']!, height: 55, width: 55, fit: BoxFit.cover),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 60,
                              child: Text(
                                issueList[index]['title']!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 6),
                          ],
                        ),
                      );
                    },
                    itemCount: issueList.length,
                  ),
                ),
              ),
              Container(height: 12, width: double.maxFinite, color: Colors.grey.withOpacity(0.2)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Stay informed with latest articles",
                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    return Container(
                      height: 197,
                      width: 187,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), border: Border.all(color: const Color(0xffC2CFF9))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(articleList[index]['image'] ?? "", height: 77, width: 163, fit: BoxFit.fill),
                          Text(
                            articleList[index]['title'] ?? "",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                articleList[index]['source'] ?? "",
                                style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              Text(
                                articleList[index]['time'] ?? "",
                                style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: articleList.length,
                ),
              ),
              const SizedBox(height: 12),
              Container(height: 12, width: double.maxFinite, color: Colors.grey.withOpacity(0.2)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Listen to calming mindfulness music",
                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    Text(
                      "View all",
                      style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: 170,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Container(
                          height: 167,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                          decoration: BoxDecoration(color: primaryColor.withOpacity(0.05), borderRadius: BorderRadius.circular(12), border: Border.all(color: primaryColor)),
                          child: Column(
                            children: [
                              Image.asset(soundList[index]['image']!, height: 98, width: 106, fit: BoxFit.cover),
                              const SizedBox(height: 6),
                              Text(
                                soundList[index]['title']!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                soundList[index]['subtitle']!,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mitr(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: soundList.length,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMyProfileCard() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 8, childAspectRatio: 1.6),
        itemCount: myProfileList.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              if (index == 3) {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const LifestyleQuestion()));
              }if (index == 1){
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const MedicalProfile()));
              }
            },
            child: Container(
              height: 108,
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white, border: Border.all(color: myProfileList[index]['color'])),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  index == 0
                      ? Image.asset(myProfileList[index]['image'], height: 40, width: 40, fit: BoxFit.fill)
                      : CircleAvatar(backgroundColor: const Color(0xffEBEFFD), child: Image.asset(myProfileList[index]['image'], height: 35, width: 35, fit: BoxFit.contain)),
                  const SizedBox(width: 6),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        myProfileList[index]['title'],
                        style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
                      ),
                      Text(
                        myProfileList[index]['time'],
                        style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        index == 0 ? "View Profile" : "Update Info",
                        style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w700, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
