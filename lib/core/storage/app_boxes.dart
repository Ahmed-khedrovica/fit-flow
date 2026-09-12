import 'package:hive/hive.dart';
import 'package:fit_flow/features/onboarding/data/models/plan_model.dart';

class AppBoxes {
  static const String planBox = 'plan_box';
  static const String prefsBox = 'prefs_box';
  static const String setProgressBox = 'set_progress_box';

  static const String currentPlanKey = 'current_plan';
  static const String localeCodeKey = 'locale_code';
  static const String onboardingDoneKey = 'onboarding_done';
  static const String weekAnchorKey = 'week_anchor';
  static const String userNameKey = 'user_name';
  static const String firstSeenDateKey = 'first_seen_date';
  static const String finishedSlotsKey = 'finished_slots';
  static const String r1RestDayKey = 'r1_rest_day';

  static Box get _prefs => Hive.box(prefsBox);
  static Box<PlanModel> get _plan => Hive.box<PlanModel>(planBox);
  static Box<int> get _setProgress => Hive.box<int>(setProgressBox);

  // Getters
  static PlanModel? get plan => _plan.get(currentPlanKey);
  static String get localeCode => _prefs.get(localeCodeKey, defaultValue: 'en');
  static bool get onboardingDone => _prefs.get(onboardingDoneKey, defaultValue: false);
  static String? get weekAnchor => _prefs.get(weekAnchorKey);
  static String? get userName => _prefs.get(userNameKey);
  static String? get firstSeenDate => _prefs.get(firstSeenDateKey);
  static List<int> get finishedSlots =>
      (_prefs.get(finishedSlotsKey, defaultValue: const <int>[]) as List)
          .cast<int>();
  static int? get r1RestDay => _prefs.get(r1RestDayKey) as int?;

  /// Completed-set count for an exercise (`exerciseId` → count). `0` when unseen.
  static int setProgress(String exerciseId) =>
      _setProgress.get(exerciseId, defaultValue: 0)!;

  // Setters
  static Future<void> setPlan(PlanModel plan) => _plan.put(currentPlanKey, plan);
  static Future<void> setLocaleCode(String code) => _prefs.put(localeCodeKey, code);
  static Future<void> setOnboardingDone(bool done) => _prefs.put(onboardingDoneKey, done);
  static Future<void> setWeekAnchor(String anchor) => _prefs.put(weekAnchorKey, anchor);
  static Future<void> setUserName(String name) => _prefs.put(userNameKey, name);
  static Future<void> setFirstSeenDate(String iso) => _prefs.put(firstSeenDateKey, iso);
  static Future<void> setFinishedSlots(List<int> slots) =>
      _prefs.put(finishedSlotsKey, slots);
  static Future<void> setR1RestDay(int day) => _prefs.put(r1RestDayKey, day);
  static Future<void> clearR1RestDay() => _prefs.delete(r1RestDayKey);

  /// Clears the workout plan and all weekly-progress data so the user can
  /// pick a new plan from the onboarding screen. Name and locale are kept.
  static Future<void> resetPlan() async {
    await _plan.clear();
    await _prefs.delete(weekAnchorKey);
    await _prefs.delete(finishedSlotsKey);
    await _prefs.delete(r1RestDayKey);
    await _prefs.put(onboardingDoneKey, false);
    await _setProgress.clear();
  }

  /// Wipes every box — used for logout and account deletion.
  static Future<void> clearAll() async {
    await _plan.clear();
    await _prefs.clear();
    await _setProgress.clear();
  }
  static Future<void> setSetProgress(String exerciseId, int count) =>
      _setProgress.put(exerciseId, count);

  static Future<void> resetWeeklyProgress(String anchor) async {
    await setWeekAnchor(anchor);
    await setFinishedSlots(const <int>[]);
    await clearR1RestDay();
  }

  /// Persists the name + first-seen date the first time the user lands on Home.
  /// First-visit is signalled by [userName] being `null`.
  static Future<void> saveFirstVisitProfile(String name) async {
    await setUserName(name);
    await setFirstSeenDate(DateTime.now().toIso8601String());
  }
}
