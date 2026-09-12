import 'package:hive/hive.dart';

import 'exercise_model.dart';

part 'workout_exercise_model.g.dart';

@HiveType(typeId: 4)
class WorkoutExerciseModel extends HiveObject {
  @HiveField(0)
  final String exerciseId;
  @HiveField(1)
  final int sets;
  @HiveField(2)
  final String reps;
  @HiveField(3)
  final int restSeconds;
  // This will be populated by the Use Case
  @HiveField(4)
  final ExerciseModel? exercise;

  /// User-entered starting weight in kg. Mutable so the workout session can
  /// set it once per exercise; persisted by re-putting the parent [PlanModel].
  @HiveField(5)
  double? startingWeight;

  WorkoutExerciseModel({
    required this.exerciseId,
    required this.sets,
    required this.reps,
    required this.restSeconds,
    this.exercise,
    this.startingWeight,
  });

  factory WorkoutExerciseModel.fromJson(Map<String, dynamic> json) {
    return WorkoutExerciseModel(
      exerciseId: json['exercise_id'] as String,
      sets: json['sets'] as int,
      reps: json['reps'].toString(), // Could be "5" or "8-12"
      restSeconds: json['rest_seconds'] as int,
      startingWeight: (json['starting_weight'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exercise_id': exerciseId,
      'sets': sets,
      'reps': reps,
      'rest_seconds': restSeconds,
      if (exercise != null) 'exercise': exercise!.toJson(),
      if (startingWeight != null) 'starting_weight': startingWeight,
    };
  }

  WorkoutExerciseModel copyWith({
    ExerciseModel? exercise,
    double? startingWeight,
  }) {
    return WorkoutExerciseModel(
      exerciseId: exerciseId,
      sets: sets,
      reps: reps,
      restSeconds: restSeconds,
      exercise: exercise ?? this.exercise,
      startingWeight: startingWeight ?? this.startingWeight,
    );
  }
}
