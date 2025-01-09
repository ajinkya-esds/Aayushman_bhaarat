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
  List<Map<String, dynamic>> myProfileList = [
    {'title': "Personal Profile", "image": "asset/profile_summery.svg", 'color': secondaryColor, 'titleColor': secondaryColor},
    {'title': "Medical History", "image": "asset/medical_history.svg", 'color': primaryColor.withOpacity(0.2), 'titleColor': primaryColor},
    {'title': "Family History", "image": "asset/family_history.svg", 'color': primaryColor.withOpacity(0.2), 'titleColor': primaryColor},
    {'title': "Lifestyle", "image": "asset/meditation.svg", 'color': primaryColor.withOpacity(0.2), 'titleColor': primaryColor},
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              children: [
                Image.asset("asset/welcome.png", width: 16, height: 16, fit: BoxFit.fill),
                const SizedBox(width: 4),
                Text(
                  "Hello Pranav!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.location_on_outlined, color: secondaryColor, size: 16),
                const SizedBox(width: 4),
                Text(
                  "ESDS Software Solution,Satpur MIDC,Nashik",
                  style: GoogleFonts.mitr(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 10),
            child: Column(
              children: [
                Icon(Icons.language, color: secondaryColor, size: 26),
                const SizedBox(width: 4),
                Text(
                  "ENG",
                  style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w300, fontSize: 12),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                SvgPicture.asset("asset/home.svg", height: 24, width: 24, color: primaryColor),
                const SizedBox(height: 2),
                Text(
                  "Home",
                  style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 12),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(bottom: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(64), color: primaryColor),
              child: Row(
                children: [
                  CircleAvatar(child: Icon(Icons.mic, color: primaryColor), backgroundColor: Colors.white),
                  const SizedBox(width: 6),
                  Text(
                    "Tap to ask",
                    style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SvgPicture.asset("asset/book.svg", height: 24, width: 24),
                const SizedBox(height: 2),
                Text(
                  "Book",
                  style: GoogleFonts.mitr(color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Profile",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "75% Completed",
                    style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: buildMyProfileCard()),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Appointment",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    height: 147,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Stack(
                      children: [
                        Container(
                          height: 120,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: primaryColor.withOpacity(0.05), border: Border.all(color: primaryColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(appointmentList[index]['image'], height: 119, width: 120, fit: BoxFit.cover),
                              Text(
                                appointmentList[index]['title'],
                                style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                            bottom: 6,
                            right: 20,
                            child: Container(
                              width: 158,
                              height: 42,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(12)),
                              child: Text(
                                "Book Now",
                                style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                            )),
                      ],
                    ),
                  );
                },
                itemCount: appointmentList.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Treating Issues",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 102,
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
                              style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: issueList.length,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Articles",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: primaryColor.withOpacity(0.05), border: Border.all(color: primaryColor)),
                    child: Row(
                      children: [
                        Image.asset(articleList[index]['image'], height: 50, width: 50, fit: BoxFit.cover),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              articleList[index]['title']!,
                              style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4 - 10,
                              child: Text(
                                articleList[index]['subtitle']!,
                                maxLines: 3,
                                style: GoogleFonts.mitr(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 14),
                              ),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dhyaan Sadhana Sounds",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  Text(
                    "View all",
                    style: GoogleFonts.mitr(color: primaryColor, fontWeight: FontWeight.w300, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                // height: 172,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xffF79D25).withOpacity(0.1)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: secondaryColor.withOpacity(0.05), child: Icon(Icons.call, color: secondaryColor, size: 18)),
                        const SizedBox(width: 8),
                        Text(
                          "Helpline",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "National Health Authority",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          "1800-11-4477",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MyGov Whatsapp Helpdesk",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          "+91 9013151515",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ayush Covid-19 Counselling",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          "14443",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Child Helpline",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                        Text(
                          "1098",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.mitr(color: secondaryColor, fontWeight: FontWeight.w400, fontSize: 14),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)), color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset("asset/national_health.svg", height: 43, width: 88),
                      const SizedBox(width: 18),
                      Text(
                        "PM Arogya Ayush App",
                        style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("asset/Logo.png", height: 65, width: 88),
                      const SizedBox(width: 18),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          "Our Vision is to create healthier India by blending modern healthcare with Ayurvedic wisdom, ensuring seamless access for every citizen",
                          style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.call, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            "1800-22-0000",
                            style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.email, color: Colors.white, size: 18),
                          const SizedBox(width: 8),
                          Text(
                            "arogyaayush@xxx.xx",
                            style: GoogleFonts.mitr(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMyProfileCard() {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 10, childAspectRatio: 1.6),
          itemCount: myProfileList.length,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                Container(
                  height: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), border: Border.all(color: myProfileList[index]['color'])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          myProfileList[index]['title'],
                          style: GoogleFonts.mitr(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                      ),
                      SvgPicture.asset(myProfileList[index]['image'], height: 30, width: 30, fit: BoxFit.cover)
                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 40,
                    right: 40,
                    child: Container(
                      width: 60,
                      height: 24,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: const Color(0xffE7F7FA), borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Fill",
                            style: GoogleFonts.mitr(color: myProfileList[index]['titleColor'], fontWeight: FontWeight.w400, fontSize: 12),
                          ),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward, color: myProfileList[index]['titleColor'], size: 14)
                        ],
                      ),
                    )),
              ],
            );
          }),
    );
  }
}
