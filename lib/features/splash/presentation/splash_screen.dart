import 'dart:async';

import 'package:fit_flow/features/home/widgets/home_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../../core/storage/app_boxes.dart';

/// Full-screen splash matching Fit Flow Figma (logo, wordmark, tagline, home indicator).
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 3), () {
      final shouldGoHome = AppBoxes.onboardingDone && AppBoxes.plan != null;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (_) =>
              shouldGoHome ? const HomeBottomNav() : const OnboardingScreen(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.splashBackground,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.splashBackground,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.svg.logo.svg(width: 120, height: 120),
              const SizedBox(height: 24),
              Text(
                S.of(context).splashBrandTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.splashBrandTitle(),
              ),
              const SizedBox(height: 8),
              Text(
                S.of(context).splashTagline,
                textAlign: TextAlign.center,
                style: AppTextStyles.splashTagline(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
