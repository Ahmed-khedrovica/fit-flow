import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'home_exercise_tile.dart';
import 'home_section_header.dart';

import '../../onboarding/data/models/plan_model.dart';

/// "Today's Exercises" section — heading plus the day's exercise list.
class HomeExercisesSection extends StatelessWidget {
  const HomeExercisesSection({super.key, required this.workoutDay});

  final WorkoutDayModel workoutDay;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final lang = Localizations.localeOf(context).languageCode;

    final tiles = workoutDay.workoutExercises.map((we) {
      return HomeExerciseTile(
        icon: Icons.fitness_center,
        name: we.exercise?.title.get(lang) ?? '',
        reps: '${we.sets} × ${we.reps}',
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
          child: HomeSectionHeader(title: s.homeTodaysExercisesTitle),
        ),
        const SizedBox(height: 16),
        ...tiles,
      ],
    );
  }
}
