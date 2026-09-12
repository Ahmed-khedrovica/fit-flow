import '../../data/models/plan_model.dart';
import '../../domain/repos/exercises_repository.dart';
import '../../domain/repos/plans_repository.dart';

class CreatePlanUseCase {
  final PlansRepository _plansRepository;
  final ExercisesRepository _exercisesRepository;

  CreatePlanUseCase(this._plansRepository, this._exercisesRepository);

  Future<PlanModel?> execute(String planId) async {
    // 1. Fetch the plan
    PlanModel plan = (await _plansRepository.getPlanById(planId))!;

    // 2. Extract all exercise IDs
    final exerciseIds = <String>{};
    for (var day in plan.workoutDays) {
      for (var exercise in day.workoutExercises) {
        exerciseIds.add(exercise.exerciseId);
      }
    }

    // 3. Fetch all exercises and filter
    final allExercises = await _exercisesRepository.getAllExercises();
    final exercises = allExercises.where((e) => exerciseIds.contains(e.id));
    final exerciseMap = {for (var e in exercises) e.id: e};

    // 4. Enrich the plan
    final enrichedDays = plan.workoutDays.map((day) {
      final enrichedExercises = day.workoutExercises.map((exercise) {
        return exercise.copyWith(exercise: exerciseMap[exercise.exerciseId]);
      }).toList();

      return WorkoutDayModel(
        dayNumber: day.dayNumber,
        workoutTitle: day.workoutTitle,
        workoutExercises: enrichedExercises,
      );
    }).toList();

    return PlanModel(
      planId: plan.planId,
      goalId: plan.goalId,
      availabilityDays: plan.availabilityDays,
      workoutDays: enrichedDays,
    );
  }
}
