import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
