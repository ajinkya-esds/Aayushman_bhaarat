import 'package:aayushman_bhaarat/home_screen/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/dot_indicator/dots_decorator.dart';
import '../utils/introduction_widget/introduction_screen.dart';
import '../utils/introduction_widget/model/page_decoration.dart';
import '../utils/introduction_widget/model/page_view_model.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Map<String, String>> introductionData = [
    {
      "title": "Welcome to PM Arogya Ayush App!",
      "image": "asset/guide1.png",
      "desc":
          "Your trusted platform for medical consultations, health advice, and wellness services. Connect with experienced doctors, schedule appointments, and access essential healthcare services anytime, anywhere. Stay informed, stay healthy!"
    },
    {
      "title": "Unlocking AI-Powered Health Insights for Smarter Care",
      "image": "asset/guide4.png",
      "desc":
          "Experience AI-powered guidance for better health and nutrition with smart, personalized recommendations. Receive tailored dietary tips and recipe suggestions based on your body's nutritional needs, helping you fill any gaps in your daily intake."
    },
    {
      "title": "Making Healthcare Simple and Accessible for Everyone",
      "image": "asset/guide2.png",
      "desc":
          "Connect with doctors, insurance, and government health services. Track your health, entitlements, and claims effortlessly. Stay updated on vaccinations and preventive care. Access personalized wellness tips and expert guidance to improve your overall health and well-being."
    },
    {
      "title": "Embracing Ayurveda and Wellness for a Healthier Life",
      "image": "asset/guide3.png",
      "desc":
          "Get personalized Ayurvedic remedies and diet plans tailored to your unique health needs. Follow structured daily routines with yoga, meditation, and balanced nutrition to enhance overall well-being. Explore the benefits of natural, locally sourced herbal solutions."
    },
  ];

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
        titleTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w700),
        ),
        bodyTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        bodyPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 10.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero);
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalFooter: GestureDetector(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xff3A63ED), Color(0xff085997)], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xff11842E)),
          width: double.infinity,
          height: 58,
          alignment: Alignment.center,
          child: Text('Continue',
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
              )),
        ),
        onTap: () => _onIntroEnd(context),
      ),

      pages: List.generate(
        introductionData.length,
        (index) =>
            PageViewModel(title: introductionData[index]['title'], body: introductionData[index]['desc'], image: _buildImage(introductionData[index]['image'] ?? ""), decoration: pageDecoration),
      ),

      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showNextButton: false,
      showBackButton: false,
      showDoneButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      // controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xff085997),
        activeSize: Size(40.0, 15.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25.0))),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      ),
    );
  }

  Future<void> _onIntroEnd(context) async {
    await startTime();
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => WhiteLableSplashScreen(image, isFrom: true)), (Route<dynamic> route) => false));
  }

  Future startTime() async {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) => const HomeScreen()));
    });
  }

  Widget _buildImage(String assetName, [double width = double.maxFinite]) {
    return Image.asset(assetName, width: MediaQuery.of(context).size.width, fit: BoxFit.fill, height: 642);
  }
}
