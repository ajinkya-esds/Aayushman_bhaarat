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
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
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
            const SizedBox(height: 12),
            buildMyProfileCard(),
            const SizedBox(height: 12),
            Row(
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
            const SizedBox(height: 12),
            Expanded(
                child: ListView.builder(
              itemBuilder: (ctx, index) {
                return Container(
                  height: 147,
                  margin: EdgeInsets.only(bottom: 12),
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
            ))
          ],
        ),
      )),
    );
  }

  Widget buildMyProfileCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.29,
      child: GridView.builder(
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
                      decoration: BoxDecoration(color: Color(0xffE7F7FA), borderRadius: BorderRadius.circular(12)),
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
