import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/storage/app_boxes.dart';
import '../../core/theme/app_colors.dart';
import 'widgets/home_exercises_section.dart';
import 'widgets/home_hero_card.dart';
import 'widgets/home_top_app_bar.dart';
import 'widgets/home_weekly_blueprint.dart';
import 'widgets/name_prompt_sheet.dart';
import 'presentation/utils/home_day_utils.dart';
import '../workout/workout_session_screen.dart';

/// Home dashboard — matches the Fit Flow "FitFlow Home Dashboard" Figma frame.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeDaySlotUtility _homeDaySlot;

  @override
  void initState() {
    super.initState();
    _homeDaySlot = HomeDaySlotUtility.get();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (AppBoxes.userName == null) {
        showNamePromptSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.transparent,
        systemNavigationBarColor: AppColors.chromeBackground,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.chromeBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeTopAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HomeWeeklyBlueprint(
                      activeSlots: _homeDaySlot.activeSlots,
                      currentSlot: _homeDaySlot.currentSlot,
                      finishedSlots: _homeDaySlot.finishedSlots,
                    ),
                    const SizedBox(height: 12),
                    HomeHeroCard(
                      workoutDay: _homeDaySlot.currentWorkoutDay,
                      onStartWorkout: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (_) => WorkoutSessionScreen(
                              plan: AppBoxes.plan!,
                              workoutDay: _homeDaySlot.currentWorkoutDay,
                              currentSlot: _homeDaySlot.currentSlot,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    HomeExercisesSection(
                      workoutDay: _homeDaySlot.currentWorkoutDay,
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
