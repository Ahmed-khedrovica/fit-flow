import '../../data/models/goal_model.dart';

abstract class GoalsRepository {
  Future<List<GoalModel>> getGoals();
}
