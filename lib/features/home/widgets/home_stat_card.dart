import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// A bento stat tile: tinted card with an icon, label, big value and a caption.
class HomeStatCard extends StatelessWidget {
  const HomeStatCard({
    super.key,
    required this.icon,
    required this.accent,
    required this.tint,
    required this.label,
    required this.value,
    required this.body,
  });

  final IconData icon;
  final Color accent;
  final Color tint;
  final String label;
  final String value;
  final String body;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tint,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20, color: accent),
            const SizedBox(height: 8),
            Text(label, style: AppTextStyles.homeStatLabel().copyWith(color: accent)),
            const SizedBox(height: 8),
            Text(value, style: AppTextStyles.homeStatValue()),
            const SizedBox(height: 8),
            Text(body, style: AppTextStyles.homeStatBody()),
          ],
        ),
      ),
    );
  }
}
