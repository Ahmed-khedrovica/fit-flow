import 'package:hive/hive.dart';

import 'workout_day_model.dart';

export 'workout_day_model.dart';
export 'workout_exercise_model.dart';

part 'plan_model.g.dart';

@HiveType(typeId: 6)
class PlanModel extends HiveObject {
  @HiveField(0)
  final String planId;
  @HiveField(1)
  final String goalId;
  @HiveField(2)
  final int availabilityDays;
  @HiveField(3)
  final List<WorkoutDayModel> workoutDays;

  PlanModel({
    required this.planId,
    required this.goalId,
    required this.availabilityDays,
    required this.workoutDays,
  });

  factory PlanModel.fromJson(Map<String, dynamic> json) {
    return PlanModel(
      planId: json['plan_id'] as String,
      goalId: json['goal_id'] as String,
      availabilityDays: json['availability_days'] as int,
      workoutDays: (json['workout_days'] as List)
          .map((e) => WorkoutDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plan_id': planId,
      'goal_id': goalId,
      'availability_days': availabilityDays,
      'workout_days': workoutDays.map((e) => e.toJson()).toList(),
    };
  }
}
