import 'package:fit_flow/core/storage/app_boxes.dart';
import 'package:fit_flow/features/onboarding/data/models/plan_model.dart';
import 'slot_calculator_utility.dart';

enum HomeDayStatus { reset, active, finished }

class HomeDaySlotUtility {
  final WorkoutDayModel currentWorkoutDay;
  final List<int?> activeSlots;
  final int? currentSlot;
  final List<int> finishedSlots;

  HomeDaySlotUtility({
    required this.currentWorkoutDay,
    required this.activeSlots,
    required this.currentSlot,
    required this.finishedSlots,
  });

  static HomeDaySlotUtility get() {
    final plan = AppBoxes.plan!;

    // Weekly reset detection
    final now = DateTime.now();
    final daysSinceSat = (now.weekday - DateTime.saturday + 7) % 7;
    final saturdayDate = now.subtract(Duration(days: daysSinceSat));
    final weekAnchor = DateTime(
      saturdayDate.year,
      saturdayDate.month,
      saturdayDate.day,
    ).toIso8601String();

    if (AppBoxes.weekAnchor != weekAnchor) {
      // Note: This triggers an async save, but for the immediate return we use the reset values.
      AppBoxes.resetWeeklyProgress(weekAnchor);
    }

    final total = plan.availabilityDays;
    final finished = (AppBoxes.weekAnchor != weekAnchor)
        ? const <int>[]
        : AppBoxes.finishedSlots;
    final daysPlayed = finished.length;
    final lastSlot = finished.isEmpty ? null : finished.last;

    final currentIndex = daysPlayed.clamp(0, plan.workoutDays.length - 1);
    final currentWorkoutDay = plan.workoutDays[currentIndex];

    final storedR1 = (AppBoxes.weekAnchor != weekAnchor)
        ? null
        : AppBoxes.r1RestDay;
    final result = SlotCalculatorUtility.calculateActiveSlots(
      total,
      daysPlayed,
      lastSlot,
      daysSinceSat,
      storedR1,
    );
    final slots = result.slots;
    if (result.r1ToStore != null && result.r1ToStore != storedR1) {
      AppBoxes.setR1RestDay(result.r1ToStore!);
    }
    final currentSlot = (daysPlayed < slots.length) ? slots[daysPlayed] : null;

    return HomeDaySlotUtility(
      currentWorkoutDay: currentWorkoutDay,
      activeSlots: slots,
      currentSlot: currentSlot,
      finishedSlots: finished,
    );
  }
}
