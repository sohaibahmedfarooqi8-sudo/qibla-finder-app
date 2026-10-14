import 'package:flutter/material.dart';
import 'package:qibla_finder/splash/splash_color.dart';

/// "Qibla Direction" title + subtitle, driven by an external [Animation].
///
/// CONCEPT — passing in an Animation<double> instead of owning a
/// controller here:
/// The parent (SplashScreen) manages one AnimationController and shares
/// slices of it with children. That's cheaper than every widget running
/// its own controller/ticker, and it keeps all timing decisions in one
/// place (the parent) instead of scattered across widgets.
class SplashTexts extends StatelessWidget {
  final Animation<double> animation;

  const SplashTexts({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    // FadeTransition + a slide built from the same animation = text
    // fades in while drifting up 20px. Reusing one Animation for both
    // effects keeps them perfectly in sync (no separate controllers to
    // de-sync).
    return FadeTransition(
      opacity: animation,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          final dy = (1 - animation.value) * 20;
          return Transform.translate(offset: Offset(0, dy), child: child);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                ),
                children: [
                  TextSpan(
                    text: 'Qibla ',
                    style: TextStyle(color: SplashColors.white),
                  ),
                  TextSpan(
                    text: 'Direction',
                    style: TextStyle(color: SplashColors.gold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Find the Right Direction\nfor Your Prayer',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: SplashColors.subtitle,
                fontSize: 14,
                height: 1.4,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
