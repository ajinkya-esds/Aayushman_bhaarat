import 'package:aayushman_bhaarat/language_screen/language_screen.dart';
import 'package:flutter/material.dart';

import '../weight/slide_action.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Center(
                child: Image.asset(
              "asset/on_boarding_bg.png",
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width,
            )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  CustomPaint(
                    size: const Size(390, 162),
                    painter: RPSCustomPainter(),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.18, width: MediaQuery.of(context).size.width, child: Image.asset("asset/digital_india.png"))
                ],
              ),
              Stack(
                children: [
                  CustomPaint(
                    size: const Size(390, 256),
                    painter: NewRPSCustomPainter(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: const EdgeInsets.only(top: 45),
                            child: const Text(
                              "Easily Consult Top Doctors Online & In-Person",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              "Consult today",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center,
                            )),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.width * 0.3,
                          child: Builder(
                            builder: (context) {
                              final GlobalKey<SlideActionState> _key = GlobalKey();
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SlideAction(
                                  key: _key,
                                  onSubmit: () {
                                    Future.delayed(
                                      const Duration(milliseconds: 500),
                                      () {
                                        Navigator.push(context, MaterialPageRoute(builder: (ctx) => const LanguageScreen()));
                                      },
                                    );
                                    return null;
                                  },
                                  innerColor: const Color(0xff11B3CF).withOpacity(1.0),
                                  outerColor: Colors.white,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Swipe To Start',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff11B3CF).withOpacity(1.0),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-84.58, -93.1917);
    path_0.lineTo(387.325, -102.661);
    path_0.cubicTo(387.325, -102.661, 455.897, 145.267, 387.325, 95);
    path_0.cubicTo(318.753, 44.7331, -19.6573, 255.505, -75.4993, 109.5);
    path_0.cubicTo(-131.341, -36.5057, -84.58, -93.1917, -84.58, -93.1917);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff11B3CF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class NewRPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(-79.4368, 266.861);
    path_0.lineTo(454.995, 277.585);
    path_0.cubicTo(454.995, 277.585, 482.997, -14.5748, 454.995, 52.8089);
    path_0.cubicTo(426.993, 120.193, 86.6235, -82.4722, -79.4364, 45.5);
    path_0.cubicTo(-245.496, 173.472, -79.4368, 266.861, -79.4368, 266.861);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff11B3CF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
