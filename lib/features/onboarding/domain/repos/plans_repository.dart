import '../../data/models/plan_model.dart';

abstract class PlansRepository {
  Future<PlanModel?> getPlanById(String planId);
}
