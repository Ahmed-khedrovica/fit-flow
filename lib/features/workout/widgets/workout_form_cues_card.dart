import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// "FORM CUES" card — info label plus a bulleted list of cues for the
/// active exercise.
class WorkoutFormCuesCard extends StatelessWidget {
  const WorkoutFormCuesCard({super.key, required this.cues});

  final List<String> cues;

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
        padding: const EdgeInsets.all(21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Icons.info, size: 20, color: AppColors.accent),
                const SizedBox(width: 8),
                Text(
                  s.workoutFormCuesLabel,
                  style: AppTextStyles.workoutFormCue(),
                ),
              ],
            ),
            for (var i = 0; i < cues.length; i++) ...[
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.only(top: 9, end: 12),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColors.accent,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      cues[i],
                      style: AppTextStyles.workoutFormCue(),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
