import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/storage/app_boxes.dart';
import '../../core/theme/app_colors.dart';
import '../onboarding/data/models/plan_model.dart';
import 'presentation/cubit/workout_session_cubit.dart';
import 'widgets/weight_entry_dialog.dart';
import 'widgets/workout_exercise_page.dart';
import 'widgets/workout_footer_bar.dart';
import 'widgets/workout_session_header.dart';

/// Default starting weight (kg) offered until the user confirms their own.
/// Mirrors the Figma "25" placeholder.
const double kWorkoutDefaultWeight = 25;

/// Workout Session — one swipeable page per exercise of the day, matching
/// the Fit Flow "Active Exercise" Figma frame. The first time an exercise
/// without a saved [WorkoutExerciseModel.startingWeight] is shown, the user
/// is prompted once to enter a weight (or accept the default); the choice is
/// persisted by re-putting the plan.
class WorkoutSessionScreen extends StatefulWidget {
  const WorkoutSessionScreen({
    super.key,
    required this.plan,
    required this.workoutDay,
    required this.currentSlot,
  });

  final PlanModel plan;
  final WorkoutDayModel workoutDay;
  final int? currentSlot;

  @override
  State<WorkoutSessionScreen> createState() => _WorkoutSessionScreenState();
}

class _WorkoutSessionScreenState extends State<WorkoutSessionScreen> {
  final PageController _pageController = PageController();
  int _currentExerciseIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _maybePromptWeight(0);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentExerciseIndex = index);
    _maybePromptWeight(index);
  }

  Future<void> _onFinish() async {
    final slot = widget.currentSlot;
    if (slot != null) {
      final storedSlot = slot + 1;
      final finished = AppBoxes.finishedSlots;
      if (!finished.contains(storedSlot)) {
        await AppBoxes.setFinishedSlots([...finished, storedSlot]);
      }
    }
    if (!mounted) return;
    Navigator.of(context).maybePop();
  }

  Future<void> _maybePromptWeight(int index) async {
    final exercises = widget.workoutDay.workoutExercises;
    final exercise = exercises[index];
    // Already saved (persists across sessions) or already asked this session.
    if (exercise.startingWeight != null) {
      return;
    }
    final weight = await showWeightEntryDialog(
      context,
      defaultWeight: kWorkoutDefaultWeight,
    );
    exercise.startingWeight = weight;
    await widget.plan.save();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final exercises = widget.workoutDay.workoutExercises;

    return BlocProvider(
      create: (_) => WorkoutSessionCubit(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.transparent,
          systemNavigationBarColor: AppColors.chromeBackground,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: AppColors.onboardingBackground,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WorkoutSessionHeader(
                onClose: () => Navigator.of(context).maybePop(),
                onFinish: _onFinish,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: exercises.length,
                  itemBuilder: (context, index) => WorkoutExercisePage(
                    workoutExercise: exercises[index],
                    defaultWeight: kWorkoutDefaultWeight,
                  ),
                ),
              ),
              WorkoutFooterBar(
                exerciseId: exercises.isNotEmpty
                    ? exercises[_currentExerciseIndex].exerciseId
                    : '',
                restSeconds: exercises.isNotEmpty
                    ? exercises[_currentExerciseIndex].restSeconds
                    : 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
