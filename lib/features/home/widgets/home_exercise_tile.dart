import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// A single exercise row: icon, name + target group, and the set/rep figure.
class HomeExerciseTile extends StatelessWidget {
  const HomeExerciseTile({
    super.key,
    required this.icon,
    required this.name,
    this.target,
    required this.reps,
  });

  final IconData icon;
  final String name;
  final String? target;
  final String reps;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.iconSurface,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name, style: AppTextStyles.homeExerciseTitle()),
                  if (target != null && target!.isNotEmpty)
                    Text(target!, style: AppTextStyles.homeExerciseSubtitle()),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(reps, style: AppTextStyles.homeExerciseReps()),
                Text(
                  s.homeRepsLabel,
                  style: AppTextStyles.homeExerciseRepsLabel(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
