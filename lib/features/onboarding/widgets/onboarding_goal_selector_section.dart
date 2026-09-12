import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../data/models/goal_model.dart';
import '../presentation/cubit/goals_cubit.dart';
import 'onboarding_goal_selector.dart';

class OnboardingGoalSelectorSection extends StatelessWidget {
  const OnboardingGoalSelectorSection({
    super.key,
    required this.selectedGoal,
    required this.onGoalChanged,
  });

  final GoalModel? selectedGoal;
  final ValueChanged<GoalModel> onGoalChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, GoalsState>(
      builder: (context, state) {
        if (state is GoalsLoading) {
          return Skeletonizer(
            enabled: true,
            child: OnboardingGoalSelector(
              goals: GoalModel.skeletons(),
              initialGoalId: null,
              onGoalChanged: (_) {},
            ),
          );
        } else if (state is GoalsSuccess) {
          return OnboardingGoalSelector(
            goals: state.goals,
            initialGoalId: selectedGoal?.id,
            onGoalChanged: onGoalChanged,
          );
        } else if (state is GoalsFailure) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
