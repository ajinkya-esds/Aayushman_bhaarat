import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'onboarding_screen/on_boarding_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures bindings are initialized
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const OnBoardingScreen(),
    );
  }
}
