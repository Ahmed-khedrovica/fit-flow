import '../../../../core/services/firebase_firestore_service.dart';
import '../../data/models/exercise_model.dart';
import '../../domain/repos/exercises_repository.dart';

class ExercisesRepositoryImpl implements ExercisesRepository {
  final FirebaseFirestoreService _firestoreService;

  ExercisesRepositoryImpl(this._firestoreService);

  @override
  Future<List<ExerciseModel>> getAllExercises() async {
    final data = await _firestoreService.getCollection('exercises');
    return data.map((e) => ExerciseModel.fromJson(e)).toList();
  }
}
