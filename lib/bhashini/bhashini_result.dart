import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/appbar_widget.dart';
import '../utils/bottombar_widget.dart';
import '../utils/drawer_widget.dart';

class BhashiniResult extends StatefulWidget {
  final String searchResult;

  const BhashiniResult({super.key, required this.searchResult});

  @override
  State<BhashiniResult> createState() => _BhashiniResultState();
}

class _BhashiniResultState extends State<BhashiniResult> {
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();
  final List<Map<String, dynamic>> remedies = [
    {
      "title": "Tulsi",
      "description": "The 'Queen of Herbs' boosts immunity and relieves cough by promoting antibodies and soothing airways.",
      "usages": [
        {"title": "Tulsi Leaves", "description": "Chew 4-5 leaves in the morning to boost immunity."},
        {"title": "Tulsi Kadha", "description": "Boil tulsi leaves with 1 tsp grated ginger and 5-6 peppercorns for 10 min. Add black salt, lemon, strain, and drink warm."},
        {"title": "Tulsi Tea", "description": "Boil fresh tulsi leaves in 1½ cups of water for 10 minutes."},
      ],
    },
    {
      "title": "Honey",
      "description": "Honey loosens mucus, eases chest congestion and wet cough. Honey also aids digestion and boosts metabolism.",
      "usages": [
        {"title": "Plain Honey", "description": "1 tsp before bed until cough subsides."},
        {"title": "Honey in Ginger Juice", "description": "Mix 1 tsp honey, 1 tsp ginger juice, and a pinch of black pepper. Take morning and night for throat relief."},
      ],
    },
    {
      "title": "Turmeric",
      "description": "Turmeric (Haldi) is a powerful natural remedy known for its anti-inflammatory, antioxidant, and antibacterial properties.",
      "usages": [
        {"title": "Turmeric in Milk", "description": "Mix 1 teaspoon of turmeric powder in warm milk and drink before bedtime."},
        {"title": "Turmeric with Water", "description": "Mix turmeric powder with warm water and drink after meals."},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      bottomNavigationBar: Container(
        height: 138,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xff3A63ED))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(backgroundColor: Color(0xff3A63ED), radius: 14, child: Icon(Icons.mic, color: Colors.white, size: 18)),
                    const SizedBox(width: 6),
                    Text(
                      "Tap to speak",
                      style: GoogleFonts.lato(color: const Color(0xff3A63ED), fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            BottombarWidget(),
          ],
        ),
      ),
      appBar: AppbarWidget(scaffoldKey: _sKey),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text("Result For ${widget.searchResult}", style: GoogleFonts.lato(fontSize: 14))),
            const SizedBox(height: 10),
            ...remedies.map((remedy) => _buildRemedyCard(remedy)).toList(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRemedyCard(Map<String, dynamic> remedy) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey)),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(remedy["title"], style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 16)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        children: [
          Text(remedy["description"], style: GoogleFonts.lato(fontSize: 14, color: Colors.black87)),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Usages", style: GoogleFonts.lato(color: Color(0xff3A63ED))),
          ),
          const SizedBox(height: 5),
          _buildUsageTimeline(remedy["usages"]),
        ],
      ),
    );
  }

  Widget _buildUsageTimeline(List<Map<String, String>> usages) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: usages.map((usage) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Icon(Icons.circle, size: 8, color: Color(0xff3A63ED)), // Bullet Point
                  Container(
                    padding: const EdgeInsets.only(left: 2),
                    child: CustomPaint(
                      size: Size(2, _calculateTextHeight(usage["title"]!, usage["description"]!, constraints.maxWidth) + 20),
                      painter: DottedLinePainter(),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(usage["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(usage["description"]!, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      );
    });
  }

  double _calculateTextHeight(String title, String description, double maxWidth) {
    TextPainter titlePainter = TextPainter(
      text: TextSpan(text: title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      maxLines: null,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    TextPainter descriptionPainter = TextPainter(
      text: TextSpan(text: description, style: const TextStyle(fontSize: 13, color: Colors.black54)),
      maxLines: null,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    return titlePainter.height + descriptionPainter.height + 10; // Adjusted for padding
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    double dashHeight = 8, dashSpace = 3, startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
