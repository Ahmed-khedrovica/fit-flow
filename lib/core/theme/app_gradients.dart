import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Reusable gradients. Compose only from [AppColors].
class AppGradients {
  AppGradients._();

  /// Vertical emphasis using splash palette (reserved for future hero sections).
  static const LinearGradient splashVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.splashBackground,
      AppColors.splashBackground,
    ],
  );
}
