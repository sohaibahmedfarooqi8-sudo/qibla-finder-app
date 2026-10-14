import 'package:flutter/material.dart';
import 'splash/splash_screen.dart';

// Rename this to main.dart in your project, or copy the relevant parts
// into your existing main.dart.
void main() {
  runApp(const QiblaFinderApp());
}

class QiblaFinderApp extends StatelessWidget {
  const QiblaFinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qibla Finder',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Poppins', // remove this line if you haven't added the font
      ),
      home: const SplashScreen(),
    );
  }
}
