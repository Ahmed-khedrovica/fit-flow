import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../data/models/goal_model.dart';
import 'onboarding_goal_card.dart';

/// A section that manages the selection of training goals.
class OnboardingGoalSelector extends StatefulWidget {
  const OnboardingGoalSelector({
    super.key,
    required this.goals,
    this.initialGoalId,
    this.onGoalChanged,
  });

  final List<GoalModel> goals;
  final String? initialGoalId;
  final ValueChanged<GoalModel>? onGoalChanged;

  @override
  State<OnboardingGoalSelector> createState() => _OnboardingGoalSelectorState();
}

class _OnboardingGoalSelectorState extends State<OnboardingGoalSelector> {
  String? _selectedGoalId = '';

  void _onGoalTap(GoalModel goal) {
    if (_selectedGoalId == goal.id) return;
    setState(() {
      _selectedGoalId = goal.id;
    });
    widget.onGoalChanged?.call(goal);
  }

  Widget _getIcon(String id) {
    final width = 22.0;
    final height = 22.0;
    final fit = BoxFit.contain;

    switch (id) {
      case 'build_muscle':
        return Assets.svg.buildMuscle.svg(
          width: width,
          height: height,
          fit: fit,
        );
      case 'get_strong':
        return Assets.svg.getStrong.svg(width: width, height: height, fit: fit);
      case 'general_fitness':
        return Assets.svg.generalFitness.svg(
          width: width,
          height: height,
          fit: fit,
        );
      default:
        return Assets.svg.generalFitness.svg(
          width: width,
          height: height,
          fit: fit,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Column(
      children: widget.goals.map((goal) {
        final isLast = goal == widget.goals.last;
        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
          child: OnboardingGoalCard(
            title: goal.title.get(languageCode),
            subtitle: goal.subtitle.get(languageCode),
            leading: _getIcon(goal.id),
            selected: _selectedGoalId == goal.id,
            onTap: () => _onGoalTap(goal),
          ),
        );
      }).toList(),
    );
  }
}
