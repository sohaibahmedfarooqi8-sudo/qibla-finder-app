import 'package:flutter/material.dart';
import '../onboarding/onboarding_screen.dart';
import 'widgets/splash_progress_bar.dart';
import 'widgets/splash_texts.dart';
import 'package:qibla_finder/splash/splash_color.dart';

/// Splash screen — background fades/scales in, text drifts up after it,
/// bottom bar fills over 5 seconds, then we navigate away.
///
/// CONCEPT — SingleTickerProviderStateMixin:
/// Every AnimationController needs a "Ticker" (a heartbeat that fires
/// every frame, ~60x/sec). Instead of Flutter spinning up a new ticker
/// per controller, this mixin lets one State host ONE ticker and hand
/// it to the controller. Use `TickerProviderStateMixin` (plural) only
/// if you need more than one AnimationController in the same State —
/// here we only have one, so Single is the leaner, correct choice.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entranceController;
  late final Animation<double> _bgFade;
  late final Animation<double> _bgScale;
  late final Animation<double> _textFade;

  static const Duration _splashDuration = Duration(seconds: 8);

  @override
  void initState() {
    super.initState();

    _entranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    // Background: fades + scales in during the FIRST 60% of the timeline.
    _bgFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    );
    _bgScale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(
        parent: _entranceController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // Text: starts at 40% and finishes at 100% — staggered so it visibly
    // follows the background instead of popping in together.
    _textFade = CurvedAnimation(
      parent: _entranceController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    );

    _entranceController.forward();
  }

  @override
  void dispose() {
    _entranceController.dispose();
    super.dispose();
  }

  void _goToNextScreen() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: SplashColors.background,
      body: Stack(
        children: [
          // Background asset: fades + gently scales up on entrance.
          FadeTransition(
            opacity: _bgFade,
            child: ScaleTransition(
              scale: _bgScale,
              child: Image.asset(
                'assets/images/splash_background.png',
                width: size.width,
                height: size.height,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Title + subtitle, placed in the gap between the compass ring
          // and the divider that's already drawn into the background.
          Positioned(
            top: size.height * 0.50,
            left: 24,
            right: 24,
            child: SplashTexts(animation: _textFade),
          ),

          // Bottom loading bar.
          Positioned(
            left: 0,
            right: 0,
            bottom: size.height * 0.06,
            child: SplashProgressBar(
              duration: _splashDuration,
              onComplete: _goToNextScreen,
            ),
          ),
        ],
      ),
    );
  }
}
