import '../../../../core/services/firebase_firestore_service.dart';
import '../../data/models/goal_model.dart';
import '../../domain/repos/goals_repository.dart';

class GoalsRepositoryImpl implements GoalsRepository {
  final FirebaseFirestoreService _firestoreService;

  GoalsRepositoryImpl(this._firestoreService);

  @override
  Future<List<GoalModel>> getGoals() async {
    final data = await _firestoreService.getCollection('goals');
    return data.map((e) => GoalModel.fromJson(e)).toList();
  }
}
