import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

import '../../onboarding/data/models/plan_model.dart';

/// "Today's Focus" hero card — active plan summary with a primary CTA.
class HomeHeroCard extends StatelessWidget {
  const HomeHeroCard({
    super.key,
    required this.workoutDay,
    this.onStartWorkout,
  });

  final WorkoutDayModel workoutDay;
  final VoidCallback? onStartWorkout;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final lang = Localizations.localeOf(context).languageCode;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            // Soft accent glow bleeding off the top-right corner.
            PositionedDirectional(
              top: -48,
              end: -48,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                child: Container(
                  width: 192,
                  height: 192,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentWash,
                  ),
                ),
              ),
            ),
            // TODO(asset): faint 3D weights graphic (Figma "3D weights
            // representation", 364×364 @ 10% opacity) — add the PNG under
            // assets/images/ then render via Assets.images.* here.
            Padding(
              padding: const EdgeInsets.all(21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.iconSurface,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.fitness_center,
                          size: 20,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        s.homeActivePlanEyebrow,
                        style: AppTextStyles.homeHeroEyebrow(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    workoutDay.workoutTitle.get(lang),
                    style: AppTextStyles.homeHeroTitle(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _MetaItem(
                        icon: Icons.schedule,
                        label: s.homeActivePlanDuration,
                      ),
                      const SizedBox(width: 16),
                      _MetaItem(
                        icon: Icons.fitness_center,
                        label: s.homeActivePlanExerciseCount(
                          workoutDay.workoutExercises.length,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _StartWorkoutButton(
                    label: s.homeStartWorkout,
                    onPressed: onStartWorkout,
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

class _MetaItem extends StatelessWidget {
  const _MetaItem({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.textCaption),
        const SizedBox(width: 6),
        Text(label, style: AppTextStyles.homeHeroMeta()),
      ],
    );
  }
}

class _StartWorkoutButton extends StatelessWidget {
  const _StartWorkoutButton({required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        minimumSize: const Size.fromHeight(56),
        shape: const StadiumBorder(),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: AppTextStyles.homeHeroButton()),
          const SizedBox(width: 8),
          const Icon(Icons.play_arrow, size: 16, color: AppColors.surface),
        ],
      ),
    );
  }
}
