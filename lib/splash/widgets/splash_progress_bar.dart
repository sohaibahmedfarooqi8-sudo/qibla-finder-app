import 'package:flutter/material.dart';
import 'package:qibla_finder/splash/splash_color.dart';

/// Bottom loading bar: percentage on top, a track that fills left→right,
/// exactly like the VR Player splash you shared.
///
/// CONCEPT — TweenAnimationBuilder vs AnimationController:
/// For a "run once from 0 to 1 and tell me when you're done" animation,
/// TweenAnimationBuilder is less boilerplate than manually creating a
/// controller with SingleTickerProviderStateMixin, calling forward(),
/// and disposing it. Use AnimationController when you need to pause,
/// reverse, or share the animation across widgets (like we did for the
/// text). Use TweenAnimationBuilder for simple "fire and forget" runs.
class SplashProgressBar extends StatelessWidget {
  final Duration duration;
  final VoidCallback onComplete;

  const SplashProgressBar({
    super.key,
    required this.duration,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeInOut,
      onEnd: onComplete,
      builder: (context, value, child) {
        final percent = (value * 100).toInt();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Rough width of the "91%" label so we can keep it from
              // clipping off either edge of the track while it slides.
              const labelWidth = 34.0;
              final maxLeft = constraints.maxWidth - labelWidth;
              final labelLeft = (constraints.maxWidth * value).clamp(
                0.0,
                maxLeft,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 18,
                    child: Stack(
                      children: [
                        // Positioned (not static Padding) is what makes
                        // this "move" — its offset is driven by the same
                        // `value` the fill bar uses, so both stay in sync
                        // every frame instead of the label sitting still
                        // while the bar fills underneath it.
                        Positioned(
                          left: labelLeft,
                          child: Text(
                            '$percent%',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 251, 251, 249),
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  _Track(value: value),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _Track extends StatelessWidget {
  final double value;
  const _Track({required this.value});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fillWidth = constraints.maxWidth * value;
        return Stack(
          children: [
            // Base track
            Container(
              height: 5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: SplashColors.trackGrey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Gold fill that grows left → right, with a soft glow at the
            // leading edge so it reads as "moving" rather than static.
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 5,
              width: fillWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [SplashColors.goldSoft, SplashColors.gold],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
