import '../../data/models/exercise_model.dart';

abstract class ExercisesRepository {
  Future<List<ExerciseModel>> getAllExercises();
}
