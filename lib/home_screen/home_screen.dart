import 'package:aayushman_bhaarat/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
    {"title": "E-Vaidya", "image": "asset/evaidya.png"},
    {"title": "Aarogya Varta", "image": "asset/aarogya_varta.png"}
  ];
  List<Map<String, dynamic>> articleList = [
    {"title": "Regional", "subtitle": "Kerala Promotes Ayurveda with Free Health Camps for local Communities", "image": "asset/article1.png"},
    {"title": "National", "subtitle": "ABHA: Transforming healthcare for 1.4 Billion citizens.", "image": "asset/article2.png"},
    {"title": "International", "subtitle": "Virus Detected: Research Report submitted to Health Cell.", "image": "asset/article3.png"}
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
      bottomNavigationBar: Container(
        height: 58,
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14)), border: Border.all(color: Colors.grey.shade200, width: 2)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SvgPicture.asset("asset/home.svg", height: 24, width: 24, color: const Color(0xff3A63ED)),
                const SizedBox(height: 2),
                Text(
                  "Home",
                  style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(64), color: const Color(0xff3A63ED)),
              child: Row(
                children: [
                  const CircleAvatar(backgroundColor: Colors.white, child: Icon(Icons.mic, color: Color(0xff3A63ED))),
                  const SizedBox(width: 6),
                  Text(
                    "Tap to ask",
                    style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SvgPicture.asset("asset/alert.svg", height: 24, width: 24),
                const SizedBox(height: 2),
                Text(
                  "Alerts",
                  style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 24, top: 30, bottom: 20, right: 12),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(14)),
                  gradient: LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("asset/Profile.png", height: 64, width: 56, fit: BoxFit.fill),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pranav Shukla",
                        style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Joined February 2024",
                        style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios_outlined, size: 24, color: Colors.white)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 40,
                      child: ListTile(
                        dense: true,
                        leading: Image.asset("asset/ahs.png", height: 24, width: 24),
                        title: Text(
                          "Ayush Health Services",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                      ),
                    ),
                    const Divider(height: 5),
                    SizedBox(
                      height: 40,
                      child: ListTile(
                        dense: true,
                        leading: Image.asset("asset/card.png", height: 24, width: 24),
                        title: Text(
                          "ABHA Create & Login",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                      ),
                    ),
                    const Divider(height: 5),
                    SizedBox(
                      height: 40,
                      child: ListTile(
                        dense: true,
                        leading: Image.asset("asset/arogya_mandir.png", height: 24, width: 24),
                        title: Text(
                          "Arogya Mandir Near Me",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                      ),
                    ),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/ayush.png", height: 24, width: 24),
                          title: Text(
                            "Ayush eVaidya",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/varta.png", height: 24, width: 24),
                          title: Text(
                            "Aarogya Varta",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/poshan.png", height: 24, width: 24),
                          title: Text(
                            "Ayush Poshan",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/yog_kutir.png", height: 24, width: 24),
                          title: Text(
                            "Yog kutir",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/swasthghar.png", height: 24, width: 24),
                          title: Text(
                            "Ayush Swasthghar",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/shishu_ahaar.png", height: 24, width: 24),
                          title: Text(
                            "Ayush Shishughar",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/appoint.png", height: 24, width: 24),
                          title: Text(
                            "My Appointments",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/settings.png", height: 24, width: 24),
                          title: Text(
                            "Settings",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/remove.png", height: 24, width: 24),
                          title: Text(
                            "Delete Account",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    SizedBox(
                        height: 40,
                        child: ListTile(
                          dense: true,
                          leading: Image.asset("asset/logout.png", height: 24, width: 24),
                          title: Text(
                            "Log Out",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
                        )),
                    const Divider(height: 5),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: "Helpline - ",
                              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
                              children: [
                                TextSpan(text: "1800-11-4477", style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12)),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: "Child Helpline - ",
                              style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
                              children: [
                                TextSpan(text: "1098", style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: "WhatsApp Helpdesk - ",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
                          children: [
                            TextSpan(text: " +91 9013151515", style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: RichText(
                        text: TextSpan(
                          text: "Ayush Covid-19 Counselling - ",
                          style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 12),
                          children: [
                            TextSpan(text: " 1800-11-4477", style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(14), topLeft: Radius.circular(14)),
                          gradient: LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                      child: Text(
                        textAlign: TextAlign.center,
                        "© 2024 Ayushman Bharat - PM Arogya Ayush App\n All right reserved.",
                        style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
                                    Image.asset("asset/appointment.png", height: 44, width: 44, fit: BoxFit.fill),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Dr.Shripad Joshi",
                                      style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "General Consultation",
                                      style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        const Icon(Icons.calendar_month, color: Colors.grey, size: 18),
                                        const SizedBox(width: 6),
                                        Text(
                                          "Tue, Feb 4",
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
                                          "5:30 PM - 7:00 PM",
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
                          Image.asset("asset/new_article.png", height: 77, width: 163, fit: BoxFit.fill),
                          Text(
                            "New Ayurvedic Medicine Shows Promising Results for Stress Relief",
                            style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "VIE stories",
                                style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                              Text(
                                "1d ago",
                                style: GoogleFonts.lato(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
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
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 8, childAspectRatio: 1.6),
          itemCount: myProfileList.length,
          itemBuilder: (ctx, index) {
            return Container(
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
            );
          }),
    );
  }
}
