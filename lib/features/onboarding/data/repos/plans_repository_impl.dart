import '../../../../core/services/firebase_firestore_service.dart';
import '../../data/models/plan_model.dart';
import '../../domain/repos/plans_repository.dart';

class PlansRepositoryImpl implements PlansRepository {
  final FirebaseFirestoreService _firestoreService;

  PlansRepositoryImpl(this._firestoreService);

  @override
  Future<PlanModel?> getPlanById(String planId) async {
    final results = await _firestoreService.getDocumentsByQuery('plans', 'plan_id', planId);
    if (results.isEmpty) return null;
    return PlanModel.fromJson(results.first);
  }
}
