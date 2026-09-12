import 'dart:ui';

import 'package:fit_flow/features/home/widgets/home_bottom_nav.dart';
import 'package:fit_flow/features/onboarding/data/models/goal_model.dart';
import 'package:fit_flow/features/onboarding/presentation/cubit/goals_cubit.dart';
import 'package:fit_flow/features/onboarding/presentation/cubit/plan_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/di/service_locator.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../generated/l10n.dart';
import 'widgets/language_dropdown.dart';
import 'widgets/onboarding_app_bar.dart';
import 'widgets/onboarding_continue_button.dart';
import 'widgets/onboarding_frequency_section.dart';
import 'widgets/onboarding_goal_selector_section.dart';

/// Onboarding: goal, weekly availability, and continue — matches Fit Flow Figma.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  GoalModel? _selectedGoal;
  int _availabilityIndex = 1;

  String _getPlanId(String goalId, int availabilityDays) {
    if (goalId == 'get_strong') {
      if (availabilityDays == 2) return 'plan_01';
      if (availabilityDays == 3) return 'plan_02';
      if (availabilityDays == 4) return 'plan_03';
      return 'plan_04';
    } else if (goalId == 'build_muscle') {
      if (availabilityDays == 2) return 'plan_05';
      if (availabilityDays == 3) return 'plan_06';
      if (availabilityDays == 4) return 'plan_07';
      return 'plan_08';
    } else {
      if (availabilityDays == 2) return 'plan_09';
      if (availabilityDays == 3) return 'plan_10';
      if (availabilityDays == 4) return 'plan_11';
      return 'plan_12';
    }
  }

  void _goHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const HomeBottomNav()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<GoalsCubit>()..fetchGoals()),
        BlocProvider(create: (_) => sl<PlanCubit>()),
      ],
      child: BlocListener<PlanCubit, PlanState>(
        listener: (context, state) {
          if (state is PlanSuccess) {
            _goHome();
          } else if (state is PlanFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: AppColors.onboardingBackground,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: AppColors.onboardingBackground,
            appBar: OnboardingAppBar(
              brandLabel: s.splashBrandTitle,
              helpSemanticsLabel: s.onboardingHelpSemantics,
              trailing: const LanguageDropdown(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      20,
                      0,
                      20,
                      24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                s.onboardingSelectGoalTitle,
                                style: AppTextStyles.onboardingTitle(),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                s.onboardingSelectGoalSubtitle,
                                style: AppTextStyles.onboardingSubtitle(),
                              ),
                            ],
                          ),
                        ),
                        OnboardingGoalSelectorSection(
                          selectedGoal: _selectedGoal,
                          onGoalChanged: (goal) => _selectedGoal = goal,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          s.onboardingWeeklyAvailabilityTitle,
                          style: AppTextStyles.onboardingSectionTitle(),
                        ),
                        const SizedBox(height: 16),
                        OnboardingFrequencySection(
                          labels: [
                            s.onboardingDays2,
                            s.onboardingDays3,
                            s.onboardingDays4,
                            s.onboardingDays5Plus,
                          ],
                          initialIndex: _availabilityIndex,
                          onChanged: (index) => _availabilityIndex = index,
                        ),
                      ],
                    ),
                  ),
                ),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColors.scrim,
                        border: Border(
                          top: BorderSide(color: AppColors.border),
                        ),
                      ),
                      child: SafeArea(
                        top: false,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            24,
                            25,
                            24,
                            24,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Builder(
                                builder: (context) {
                                  return OnboardingContinueButton(
                                    onPressed: () {
                                      if (_selectedGoal == null) return;
                                      final availabilityDays = [
                                        2,
                                        3,
                                        4,
                                        5,
                                      ][_availabilityIndex];
                                      final planId = _getPlanId(
                                        _selectedGoal!.id,
                                        availabilityDays,
                                      );
                                      context.read<PlanCubit>().fetchPlan(
                                        planId,
                                      );
                                    },
                                  );
                                },
                              ),
                              const SizedBox(height: 16),
                              Text(
                                s.onboardingChangeLaterDisclaimer,
                                style: AppTextStyles.onboardingDisclaimer(),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
