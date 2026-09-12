import 'package:hive/hive.dart';

import 'localized_string.dart';
import 'workout_exercise_model.dart';

part 'workout_day_model.g.dart';

@HiveType(typeId: 5)
class WorkoutDayModel {
  @HiveField(0)
  final int dayNumber;
  @HiveField(1)
  final LocalizedString workoutTitle;
  @HiveField(2)
  final List<WorkoutExerciseModel> workoutExercises;

  WorkoutDayModel({
    required this.dayNumber,
    required this.workoutTitle,
    required this.workoutExercises,
  });

  factory WorkoutDayModel.fromJson(Map<String, dynamic> json) {
    return WorkoutDayModel(
      dayNumber: json['day_number'] as int,
      workoutTitle:
          LocalizedString.fromJson(json['workout_title'] as Map<String, dynamic>),
      workoutExercises: (json['workout_exercises'] as List)
          .map((e) => WorkoutExerciseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day_number': dayNumber,
      'workout_title': workoutTitle.toJson(),
      'workout_exercises': workoutExercises.map((e) => e.toJson()).toList(),
    };
  }
}
