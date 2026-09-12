import 'package:bloc/bloc.dart';
import '../../data/models/goal_model.dart';
import '../../domain/repos/goals_repository.dart';

abstract class GoalsState {}

class GoalsInitial extends GoalsState {}

class GoalsLoading extends GoalsState {}

class GoalsSuccess extends GoalsState {
  final List<GoalModel> goals;
  GoalsSuccess(this.goals);
}

class GoalsFailure extends GoalsState {
  final String message;
  GoalsFailure(this.message);
}

class GoalsCubit extends Cubit<GoalsState> {
  final GoalsRepository _goalsRepository;

  GoalsCubit(this._goalsRepository) : super(GoalsInitial());

  Future<void> fetchGoals() async {
    emit(GoalsLoading());
    try {
      final goals = await _goalsRepository.getGoals();
      emit(GoalsSuccess(goals));
    } catch (e) {
      emit(GoalsFailure(e.toString()));
    }
  }
}
