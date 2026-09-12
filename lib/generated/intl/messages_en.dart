// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} Exercises";

  static String m1(count) => "${count} Days/Week";

  static String m2(date) => "Member since ${date}";

  static String m3(version) => "FitFlow Version ${version}";

  static String m4(time) => "Start Rest Timer (${time})";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "counterPrompt": MessageLookupByLibrary.simpleMessage(
            "You have pushed the button this many times:"),
        "homeActivePlanDuration":
            MessageLookupByLibrary.simpleMessage("45 Minutes"),
        "homeActivePlanExerciseCount": m0,
        "homeActivePlanEyebrow":
            MessageLookupByLibrary.simpleMessage("ACTIVE PLAN"),
        "homeDayFri": MessageLookupByLibrary.simpleMessage("F"),
        "homeDayMon": MessageLookupByLibrary.simpleMessage("M"),
        "homeDaySat": MessageLookupByLibrary.simpleMessage("S"),
        "homeDaySun": MessageLookupByLibrary.simpleMessage("S"),
        "homeDayThu": MessageLookupByLibrary.simpleMessage("T"),
        "homeDayTue": MessageLookupByLibrary.simpleMessage("T"),
        "homeDayWed": MessageLookupByLibrary.simpleMessage("W"),
        "homeGreeting": MessageLookupByLibrary.simpleMessage("Good Morning"),
        "homeGreetingSubtitle":
            MessageLookupByLibrary.simpleMessage("Let\'s get to work."),
        "homeNavHome": MessageLookupByLibrary.simpleMessage("Home"),
        "homeNavLearn": MessageLookupByLibrary.simpleMessage("Learn"),
        "homeNavProfile": MessageLookupByLibrary.simpleMessage("Profile"),
        "homeRecoveryBody": MessageLookupByLibrary.simpleMessage(
            "Optimal status for training today."),
        "homeRecoveryLabel": MessageLookupByLibrary.simpleMessage("RECOVERY"),
        "homeRecoveryValue": MessageLookupByLibrary.simpleMessage("94%"),
        "homeRepsLabel": MessageLookupByLibrary.simpleMessage("REPS"),
        "homeSettingsSemantics":
            MessageLookupByLibrary.simpleMessage("Settings"),
        "homeStartWorkout":
            MessageLookupByLibrary.simpleMessage("Start Workout"),
        "homeTodaysExercisesTitle":
            MessageLookupByLibrary.simpleMessage("Today\'s Exercises"),
        "homeWeekLabel": MessageLookupByLibrary.simpleMessage("Week 1"),
        "homeWeeklyBlueprintTitle":
            MessageLookupByLibrary.simpleMessage("Weekly Blueprint"),
        "homeWeeklyBurnBody": MessageLookupByLibrary.simpleMessage(
            "Active kcal burned this week."),
        "homeWeeklyBurnLabel":
            MessageLookupByLibrary.simpleMessage("WEEKLY BURN"),
        "homeWeeklyBurnValue": MessageLookupByLibrary.simpleMessage("2,450"),
        "incrementTooltip": MessageLookupByLibrary.simpleMessage("Increment"),
        "languageArabic": MessageLookupByLibrary.simpleMessage("العربية"),
        "languageEnglish": MessageLookupByLibrary.simpleMessage("English (US)"),
        "namePromptDefaultName":
            MessageLookupByLibrary.simpleMessage("Athlete"),
        "namePromptHint": MessageLookupByLibrary.simpleMessage("Your name"),
        "namePromptSubtitle": MessageLookupByLibrary.simpleMessage(
            "Personalize your FitFlow experience. You can change this later."),
        "namePromptTitle":
            MessageLookupByLibrary.simpleMessage("What should we call you?"),
        "onboardingChangeLaterDisclaimer": MessageLookupByLibrary.simpleMessage(
            "YOU CAN CHANGE THIS LATER IN PROFILE"),
        "onboardingContinue": MessageLookupByLibrary.simpleMessage("Continue"),
        "onboardingDays2": MessageLookupByLibrary.simpleMessage("2 Days"),
        "onboardingDays3": MessageLookupByLibrary.simpleMessage("3 Days"),
        "onboardingDays4": MessageLookupByLibrary.simpleMessage("4 Days"),
        "onboardingDays5Plus": MessageLookupByLibrary.simpleMessage("5+ Days"),
        "onboardingGoalBuildMuscleDescription":
            MessageLookupByLibrary.simpleMessage(
                "Focus on hypertrophy and strength."),
        "onboardingGoalBuildMuscleTitle":
            MessageLookupByLibrary.simpleMessage("Build Muscle"),
        "onboardingGoalGeneralFitnessDescription":
            MessageLookupByLibrary.simpleMessage(
                "Balanced health and mobility."),
        "onboardingGoalGeneralFitnessTitle":
            MessageLookupByLibrary.simpleMessage("General Fitness"),
        "onboardingGoalGetStrongDescription":
            MessageLookupByLibrary.simpleMessage(
                "Prioritize heavy lifting and power."),
        "onboardingGoalGetStrongTitle":
            MessageLookupByLibrary.simpleMessage("Get Strong"),
        "onboardingHelpSemantics": MessageLookupByLibrary.simpleMessage("Help"),
        "onboardingRecommendedCaption":
            MessageLookupByLibrary.simpleMessage("Optimal recovery cycle"),
        "onboardingRecommendedLabel":
            MessageLookupByLibrary.simpleMessage("RECOMMENDED"),
        "onboardingSelectGoalSubtitle": MessageLookupByLibrary.simpleMessage(
            "Customize your journey for precision performance."),
        "onboardingSelectGoalTitle":
            MessageLookupByLibrary.simpleMessage("Select Your Goal"),
        "onboardingWeeklyAvailabilityTitle":
            MessageLookupByLibrary.simpleMessage("Weekly Availability"),
        "profileActiveGoalLabel":
            MessageLookupByLibrary.simpleMessage("ACTIVE GOAL"),
        "profileActiveGoalPlaceholder":
            MessageLookupByLibrary.simpleMessage("Build Muscle"),
        "profileDeleteAccountRow":
            MessageLookupByLibrary.simpleMessage("Delete Account"),
        "profileEditAvatarSemantics":
            MessageLookupByLibrary.simpleMessage("Edit photo"),
        "profileFrequencyLabel":
            MessageLookupByLibrary.simpleMessage("FREQUENCY"),
        "profileFrequencyValue": m1,
        "profileLanguageRow": MessageLookupByLibrary.simpleMessage("Language"),
        "profileLogoutRow": MessageLookupByLibrary.simpleMessage("Log Out"),
        "profileMemberSince": m2,
        "profilePreferencesHeading":
            MessageLookupByLibrary.simpleMessage("Preferences & Account"),
        "profilePrivacyRow":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "profileResetPlanRow":
            MessageLookupByLibrary.simpleMessage("Reset Workout Plan"),
        "profileTermsRow":
            MessageLookupByLibrary.simpleMessage("Terms of Service"),
        "profileTitle": MessageLookupByLibrary.simpleMessage("Health Profile"),
        "profileVersion": m3,
        "splashBrandTitle": MessageLookupByLibrary.simpleMessage("FitFlow"),
        "splashTagline":
            MessageLookupByLibrary.simpleMessage("ELEVATE YOUR MOVEMENT"),
        "weightDialogSaveStart":
            MessageLookupByLibrary.simpleMessage("Save & Start"),
        "weightDialogSubtitle": MessageLookupByLibrary.simpleMessage(
            "Don\'t worry, you can update this later whenever you want."),
        "weightDialogTitle":
            MessageLookupByLibrary.simpleMessage("Enter Starting Weight"),
        "weightDialogUseDefault":
            MessageLookupByLibrary.simpleMessage("Not sure? Use default"),
        "workoutAddSet": MessageLookupByLibrary.simpleMessage("ADD SET"),
        "workoutFinish": MessageLookupByLibrary.simpleMessage("Finish"),
        "workoutFormCuesLabel":
            MessageLookupByLibrary.simpleMessage("FORM CUES"),
        "workoutSessionTitle":
            MessageLookupByLibrary.simpleMessage("Workout Session"),
        "workoutStartRestTimer": m4,
        "workoutTableDone": MessageLookupByLibrary.simpleMessage("DONE"),
        "workoutTableReps": MessageLookupByLibrary.simpleMessage("REPS"),
        "workoutTableSet": MessageLookupByLibrary.simpleMessage("SET"),
        "workoutTableWeight": MessageLookupByLibrary.simpleMessage("WEIGHT"),
        "workoutWeightUnitKg": MessageLookupByLibrary.simpleMessage("kg")
      };
}
