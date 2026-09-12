import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../gen/assets.gen.dart';

/// Hero card with recommended plan artwork (local SVG per design).
class OnboardingRecommendedCard extends StatelessWidget {
  const OnboardingRecommendedCard({
    super.key,
    required this.badgeLabel,
    required this.caption,
  });

  final String badgeLabel;
  final String caption;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 21 / 9,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(Assets.images.recommendedPlanImage.path),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    AppColors.surface,
                    AppColors.surface.withValues(alpha: 0),
                    AppColors.surface.withValues(alpha: 0),
                  ],
                  stops: const [0, 0.45, 1],
                ),
              ),
            ),
            PositionedDirectional(
              start: 16,
              end: 16,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    badgeLabel,
                    style: AppTextStyles.onboardingRecommendedBadge(),
                  ),
                  Flexible(
                    child: Text(
                      caption,
                      style: AppTextStyles.onboardingRecommendedCaption(),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
