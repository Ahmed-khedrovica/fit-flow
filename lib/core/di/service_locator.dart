import 'package:get_it/get_it.dart';
import '../services/firebase_firestore_service.dart';
import '../../features/onboarding/data/repos/goals_repository_impl.dart';
import '../../features/onboarding/domain/repos/goals_repository.dart';
import '../../features/onboarding/data/repos/exercises_repository_impl.dart';
import '../../features/onboarding/domain/repos/exercises_repository.dart';
import '../../features/onboarding/data/repos/plans_repository_impl.dart';
import '../../features/onboarding/domain/repos/plans_repository.dart';
import '../../features/onboarding/domain/usecases/create_plan_usecase.dart';
import '../../features/onboarding/presentation/cubit/goals_cubit.dart';
import '../../features/onboarding/presentation/cubit/plan_cubit.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  // Services
  sl.registerLazySingleton<FirebaseFirestoreService>(() => FirebaseFirestoreService());

  // Repositories
  sl.registerLazySingleton<GoalsRepository>(() => GoalsRepositoryImpl(sl()));
  sl.registerLazySingleton<ExercisesRepository>(() => ExercisesRepositoryImpl(sl()));
  sl.registerLazySingleton<PlansRepository>(() => PlansRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton<CreatePlanUseCase>(() => CreatePlanUseCase(sl(), sl()));

  // Cubits
  sl.registerFactory<GoalsCubit>(() => GoalsCubit(sl()));
  sl.registerFactory<PlanCubit>(() => PlanCubit(sl()));
}
