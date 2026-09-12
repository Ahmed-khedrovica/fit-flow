import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../onboarding/data/models/plan_model.dart';
import 'workout_form_cues_card.dart';
import 'workout_media_zone.dart';
import 'workout_sets_table.dart';

/// A single swipeable exercise page: media zone, title, form cues, and the
/// frictionless sets table.
class WorkoutExercisePage extends StatelessWidget {
  const WorkoutExercisePage({
    super.key,
    required this.workoutExercise,
    required this.defaultWeight,
  });

  final WorkoutExerciseModel workoutExercise;

  /// Weight pre-filled (greyed) in the sets table until the user confirms one.
  final double defaultWeight;

  @override
  Widget build(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final exercise = workoutExercise.exercise;
    final title = exercise?.title.get(lang) ?? '';
    final cues = exercise?.formCues.get(lang) ?? const <String>[];
    final weight = workoutExercise.startingWeight ?? defaultWeight;
    final weightText = weight == weight.roundToDouble()
        ? weight.toStringAsFixed(0)
        : weight.toString();
    final weightLabel = '${weightText}kg';

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          WorkoutMediaZone(onPlay: () {}, onFullscreen: () {}),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 32, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: AppTextStyles.homeExerciseTitle()),
                const SizedBox(height: 16),
                WorkoutFormCuesCard(cues: cues),
                const SizedBox(height: 24),
                WorkoutSetsTable(
                  exerciseId: workoutExercise.exerciseId,
                  sets: workoutExercise.sets,
                  reps: workoutExercise.reps,
                  weightLabel: weightLabel,
                  onAddSet: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
