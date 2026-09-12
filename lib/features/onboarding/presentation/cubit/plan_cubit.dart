import 'package:bloc/bloc.dart';
import '../../data/models/plan_model.dart';
import '../../domain/usecases/create_plan_usecase.dart';
import '../../../../core/storage/app_boxes.dart';

abstract class PlanState {}

class PlanInitial extends PlanState {}

class PlanLoading extends PlanState {}

class PlanSuccess extends PlanState {
  final PlanModel plan;
  PlanSuccess(this.plan);
}

class PlanFailure extends PlanState {
  final String message;
  PlanFailure(this.message);
}

class PlanCubit extends Cubit<PlanState> {
  final CreatePlanUseCase _createPlanUseCase;

  PlanCubit(this._createPlanUseCase) : super(PlanInitial());

  Future<void> fetchPlan(String planId) async {
    emit(PlanLoading());
    try {
      final plan = await _createPlanUseCase.execute(planId);
      if (plan != null) {
        await AppBoxes.setPlan(plan);
        await AppBoxes.setOnboardingDone(true);
        emit(PlanSuccess(plan));
      } else {
        emit(PlanFailure('Plan not found'));
      }
    } catch (e) {
      emit(PlanFailure(e.toString()));
    }
  }
}
