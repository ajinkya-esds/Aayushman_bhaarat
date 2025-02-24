import 'package:aayushman_bhaarat/utils/bottombar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../utils/appbar_widget.dart';
import '../utils/drawer_widget.dart';
import 'bhashini_result.dart';

class BhashiniScreeen extends StatefulWidget {
  const BhashiniScreeen({super.key});

  @override
  State<BhashiniScreeen> createState() => _BhashiniScreenState();
}

class _BhashiniScreenState extends State<BhashiniScreeen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = "Share your concern with us! We're here to listen, support, and help you with any questions or issues you may have. Your well-being is our priority.";
  bool _speechAvailable = false;
  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initializeSpeech();
  }

  /// Initialize speech-to-text
  Future<void> _initializeSpeech() async {
    _speechAvailable = await _speech.initialize(
      onStatus: (status) {
        print("Speech Status: $status");
        if (status == "notListening") {
          print("Called here");
          stopListening();
          setState(() {});
        } else if (status == "done") {
          if (_text.isNotEmpty) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => BhashiniResult(searchResult: _text)));
            });
          }
        }
      },
      onError: (error) => print("Speech Error: $error"),
    );
    if (!_speechAvailable) {
      print("Speech recognition is not available.");
    }
  }

  /// Start listening
  void startListening() async {
    if (_speechAvailable && !_isListening) {
      setState(() => _isListening = true);
      _speech.listen(
        listenFor: const Duration(minutes: 1),
        pauseFor: const Duration(seconds: 5),
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
          });
        },
      );
    } else {
      print("Speech recognition not available.");
    }
  }

  /// Stop listening
  void stopListening() {
    // _text = "Share your concern with us! We're here to listen, support, and help you with any questions or issues you may have.Your well-being is our priority.";
    setState(() => _isListening = false);
    _speech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        key: _sKey,
        bottomNavigationBar: BottombarWidget(),
        appBar: AppbarWidget(scaffoldKey: _sKey),
        drawer: const DrawerWidget(),
        body: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: Image.asset("asset/bhashini_dr.png", width: 293, height: 293, fit: BoxFit.fill, filterQuality: FilterQuality.low),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                textAlign: TextAlign.center,
                _text,
                // "Share your concern with us! We're here to listen, support, and help you with any questions or issues you may have. Your well-being is our priority.",
                style: GoogleFonts.lato(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: _isListening ? stopListening : startListening,

              // Navigator.push(context, MaterialPageRoute(builder: (ctx) => const BhashiniListen()));

              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                margin: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xff3A63ED)), color: !_isListening ? null : const Color(0xff3A63ED)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(backgroundColor: const Color(0xff3A63ED), radius: 14, child: Icon(!_isListening ? Icons.mic : Icons.graphic_eq, color: Colors.white, size: 18)),
                    const SizedBox(width: 6),
                    Text(
                      !_isListening ? "Tap to speak" : "Analyzing",
                      style: GoogleFonts.lato(color: !_isListening ? const Color(0xff3A63ED) : Colors.white, fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
