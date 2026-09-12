// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `You have pushed the button this many times:`
  String get counterPrompt {
    return Intl.message(
      'You have pushed the button this many times:',
      name: 'counterPrompt',
      desc: 'Label above the tap counter on the sample home screen',
      args: [],
    );
  }

  /// `Increment`
  String get incrementTooltip {
    return Intl.message(
      'Increment',
      name: 'incrementTooltip',
      desc: 'Accessibility label for the floating action button',
      args: [],
    );
  }

  /// `FitFlow`
  String get splashBrandTitle {
    return Intl.message(
      'FitFlow',
      name: 'splashBrandTitle',
      desc: 'Brand wordmark on the splash screen',
      args: [],
    );
  }

  /// `ELEVATE YOUR MOVEMENT`
  String get splashTagline {
    return Intl.message(
      'ELEVATE YOUR MOVEMENT',
      name: 'splashTagline',
      desc: 'Splash screen tagline below the brand title',
      args: [],
    );
  }

  /// `Select Your Goal`
  String get onboardingSelectGoalTitle {
    return Intl.message(
      'Select Your Goal',
      name: 'onboardingSelectGoalTitle',
      desc: 'Main heading on the onboarding goal step',
      args: [],
    );
  }

  /// `Customize your journey for precision performance.`
  String get onboardingSelectGoalSubtitle {
    return Intl.message(
      'Customize your journey for precision performance.',
      name: 'onboardingSelectGoalSubtitle',
      desc: 'Subtitle below the onboarding goal heading',
      args: [],
    );
  }

  /// `Build Muscle`
  String get onboardingGoalBuildMuscleTitle {
    return Intl.message(
      'Build Muscle',
      name: 'onboardingGoalBuildMuscleTitle',
      desc: 'Onboarding goal option title',
      args: [],
    );
  }

  /// `Focus on hypertrophy and strength.`
  String get onboardingGoalBuildMuscleDescription {
    return Intl.message(
      'Focus on hypertrophy and strength.',
      name: 'onboardingGoalBuildMuscleDescription',
      desc: 'Onboarding goal option body',
      args: [],
    );
  }

  /// `Get Strong`
  String get onboardingGoalGetStrongTitle {
    return Intl.message(
      'Get Strong',
      name: 'onboardingGoalGetStrongTitle',
      desc: 'Onboarding goal option title',
      args: [],
    );
  }

  /// `Prioritize heavy lifting and power.`
  String get onboardingGoalGetStrongDescription {
    return Intl.message(
      'Prioritize heavy lifting and power.',
      name: 'onboardingGoalGetStrongDescription',
      desc: 'Onboarding goal option body',
      args: [],
    );
  }

  /// `General Fitness`
  String get onboardingGoalGeneralFitnessTitle {
    return Intl.message(
      'General Fitness',
      name: 'onboardingGoalGeneralFitnessTitle',
      desc: 'Onboarding goal option title',
      args: [],
    );
  }

  /// `Balanced health and mobility.`
  String get onboardingGoalGeneralFitnessDescription {
    return Intl.message(
      'Balanced health and mobility.',
      name: 'onboardingGoalGeneralFitnessDescription',
      desc: 'Onboarding goal option body',
      args: [],
    );
  }

  /// `Weekly Availability`
  String get onboardingWeeklyAvailabilityTitle {
    return Intl.message(
      'Weekly Availability',
      name: 'onboardingWeeklyAvailabilityTitle',
      desc: 'Section title for training days selector',
      args: [],
    );
  }

  /// `2 Days`
  String get onboardingDays2 {
    return Intl.message(
      '2 Days',
      name: 'onboardingDays2',
      desc: 'Weekly availability segment label',
      args: [],
    );
  }

  /// `3 Days`
  String get onboardingDays3 {
    return Intl.message(
      '3 Days',
      name: 'onboardingDays3',
      desc: 'Weekly availability segment label',
      args: [],
    );
  }

  /// `4 Days`
  String get onboardingDays4 {
    return Intl.message(
      '4 Days',
      name: 'onboardingDays4',
      desc: 'Weekly availability segment label',
      args: [],
    );
  }

  /// `5+ Days`
  String get onboardingDays5Plus {
    return Intl.message(
      '5+ Days',
      name: 'onboardingDays5Plus',
      desc: 'Weekly availability segment label',
      args: [],
    );
  }

  /// `RECOMMENDED`
  String get onboardingRecommendedLabel {
    return Intl.message(
      'RECOMMENDED',
      name: 'onboardingRecommendedLabel',
      desc: 'Badge on the recommended plan preview',
      args: [],
    );
  }

  /// `Optimal recovery cycle`
  String get onboardingRecommendedCaption {
    return Intl.message(
      'Optimal recovery cycle',
      name: 'onboardingRecommendedCaption',
      desc: 'Caption on the recommended plan preview',
      args: [],
    );
  }

  /// `Continue`
  String get onboardingContinue {
    return Intl.message(
      'Continue',
      name: 'onboardingContinue',
      desc: 'Primary button on onboarding',
      args: [],
    );
  }

  /// `YOU CAN CHANGE THIS LATER IN PROFILE`
  String get onboardingChangeLaterDisclaimer {
    return Intl.message(
      'YOU CAN CHANGE THIS LATER IN PROFILE',
      name: 'onboardingChangeLaterDisclaimer',
      desc: 'Hint below onboarding continue button',
      args: [],
    );
  }

  /// `Help`
  String get onboardingHelpSemantics {
    return Intl.message(
      'Help',
      name: 'onboardingHelpSemantics',
      desc: 'Semantics label for onboarding header help control',
      args: [],
    );
  }

  /// `Good Morning`
  String get homeGreeting {
    return Intl.message(
      'Good Morning',
      name: 'homeGreeting',
      desc: 'Time-of-day greeting in the home header',
      args: [],
    );
  }

  /// `Let's get to work.`
  String get homeGreetingSubtitle {
    return Intl.message(
      'Let\'s get to work.',
      name: 'homeGreetingSubtitle',
      desc: 'Motivational line under the home greeting',
      args: [],
    );
  }

  /// `Settings`
  String get homeSettingsSemantics {
    return Intl.message(
      'Settings',
      name: 'homeSettingsSemantics',
      desc: 'Accessibility label for the home header settings button',
      args: [],
    );
  }

  /// `Weekly Blueprint`
  String get homeWeeklyBlueprintTitle {
    return Intl.message(
      'Weekly Blueprint',
      name: 'homeWeeklyBlueprintTitle',
      desc: 'Section heading for the weekly training calendar',
      args: [],
    );
  }

  /// `Week 1`
  String get homeWeekLabel {
    return Intl.message(
      'Week 1',
      name: 'homeWeekLabel',
      desc: 'Current training week indicator next to the blueprint heading',
      args: [],
    );
  }

  /// `M`
  String get homeDayMon {
    return Intl.message(
      'M',
      name: 'homeDayMon',
      desc: 'Single-letter weekday initial — Monday',
      args: [],
    );
  }

  /// `T`
  String get homeDayTue {
    return Intl.message(
      'T',
      name: 'homeDayTue',
      desc: 'Single-letter weekday initial — Tuesday',
      args: [],
    );
  }

  /// `W`
  String get homeDayWed {
    return Intl.message(
      'W',
      name: 'homeDayWed',
      desc: 'Single-letter weekday initial — Wednesday',
      args: [],
    );
  }

  /// `T`
  String get homeDayThu {
    return Intl.message(
      'T',
      name: 'homeDayThu',
      desc: 'Single-letter weekday initial — Thursday',
      args: [],
    );
  }

  /// `F`
  String get homeDayFri {
    return Intl.message(
      'F',
      name: 'homeDayFri',
      desc: 'Single-letter weekday initial — Friday',
      args: [],
    );
  }

  /// `S`
  String get homeDaySat {
    return Intl.message(
      'S',
      name: 'homeDaySat',
      desc: 'Single-letter weekday initial — Saturday',
      args: [],
    );
  }

  /// `S`
  String get homeDaySun {
    return Intl.message(
      'S',
      name: 'homeDaySun',
      desc: 'Single-letter weekday initial — Sunday',
      args: [],
    );
  }

  /// `ACTIVE PLAN`
  String get homeActivePlanEyebrow {
    return Intl.message(
      'ACTIVE PLAN',
      name: 'homeActivePlanEyebrow',
      desc: 'Uppercase eyebrow above the hero plan title',
      args: [],
    );
  }

  /// `45 Minutes`
  String get homeActivePlanDuration {
    return Intl.message(
      '45 Minutes',
      name: 'homeActivePlanDuration',
      desc: 'Estimated duration of today\'s session',
      args: [],
    );
  }

  /// `{count} Exercises`
  String homeActivePlanExerciseCount(int count) {
    return Intl.message(
      '$count Exercises',
      name: 'homeActivePlanExerciseCount',
      desc: 'Exercise count for today\'s session',
      args: [count],
    );
  }

  /// `Start Workout`
  String get homeStartWorkout {
    return Intl.message(
      'Start Workout',
      name: 'homeStartWorkout',
      desc: 'Primary call to action on the hero card',
      args: [],
    );
  }

  /// `Today's Exercises`
  String get homeTodaysExercisesTitle {
    return Intl.message(
      'Today\'s Exercises',
      name: 'homeTodaysExercisesTitle',
      desc: 'Section heading for the list of today\'s exercises',
      args: [],
    );
  }

  /// `REPS`
  String get homeRepsLabel {
    return Intl.message(
      'REPS',
      name: 'homeRepsLabel',
      desc: 'Uppercase caption under the set/rep figure',
      args: [],
    );
  }

  /// `RECOVERY`
  String get homeRecoveryLabel {
    return Intl.message(
      'RECOVERY',
      name: 'homeRecoveryLabel',
      desc: 'Label for the recovery stat tile',
      args: [],
    );
  }

  /// `94%`
  String get homeRecoveryValue {
    return Intl.message(
      '94%',
      name: 'homeRecoveryValue',
      desc: 'Recovery readiness percentage',
      args: [],
    );
  }

  /// `Optimal status for training today.`
  String get homeRecoveryBody {
    return Intl.message(
      'Optimal status for training today.',
      name: 'homeRecoveryBody',
      desc: 'Supporting copy for the recovery stat',
      args: [],
    );
  }

  /// `WEEKLY BURN`
  String get homeWeeklyBurnLabel {
    return Intl.message(
      'WEEKLY BURN',
      name: 'homeWeeklyBurnLabel',
      desc: 'Label for the weekly calorie-burn stat tile',
      args: [],
    );
  }

  /// `2,450`
  String get homeWeeklyBurnValue {
    return Intl.message(
      '2,450',
      name: 'homeWeeklyBurnValue',
      desc: 'Active kilocalories burned this week',
      args: [],
    );
  }

  /// `Active kcal burned this week.`
  String get homeWeeklyBurnBody {
    return Intl.message(
      'Active kcal burned this week.',
      name: 'homeWeeklyBurnBody',
      desc: 'Supporting copy for the weekly-burn stat',
      args: [],
    );
  }

  /// `Home`
  String get homeNavHome {
    return Intl.message(
      'Home',
      name: 'homeNavHome',
      desc: 'Bottom navigation label — home tab',
      args: [],
    );
  }

  /// `Learn`
  String get homeNavLearn {
    return Intl.message(
      'Learn',
      name: 'homeNavLearn',
      desc: 'Bottom navigation label — learn tab',
      args: [],
    );
  }

  /// `Profile`
  String get homeNavProfile {
    return Intl.message(
      'Profile',
      name: 'homeNavProfile',
      desc: 'Bottom navigation label — profile tab',
      args: [],
    );
  }

  /// `Workout Session`
  String get workoutSessionTitle {
    return Intl.message(
      'Workout Session',
      name: 'workoutSessionTitle',
      desc: 'Title in the workout session screen header',
      args: [],
    );
  }

  /// `Finish`
  String get workoutFinish {
    return Intl.message(
      'Finish',
      name: 'workoutFinish',
      desc: 'Trailing action in the workout session header to end the session',
      args: [],
    );
  }

  /// `FORM CUES`
  String get workoutFormCuesLabel {
    return Intl.message(
      'FORM CUES',
      name: 'workoutFormCuesLabel',
      desc: 'Label above the list of exercise form cues',
      args: [],
    );
  }

  /// `SET`
  String get workoutTableSet {
    return Intl.message(
      'SET',
      name: 'workoutTableSet',
      desc: 'Sets-table column header — set index',
      args: [],
    );
  }

  /// `WEIGHT`
  String get workoutTableWeight {
    return Intl.message(
      'WEIGHT',
      name: 'workoutTableWeight',
      desc: 'Sets-table column header — weight',
      args: [],
    );
  }

  /// `REPS`
  String get workoutTableReps {
    return Intl.message(
      'REPS',
      name: 'workoutTableReps',
      desc: 'Sets-table column header — repetitions',
      args: [],
    );
  }

  /// `DONE`
  String get workoutTableDone {
    return Intl.message(
      'DONE',
      name: 'workoutTableDone',
      desc: 'Sets-table column header — completed toggle',
      args: [],
    );
  }

  /// `ADD SET`
  String get workoutAddSet {
    return Intl.message(
      'ADD SET',
      name: 'workoutAddSet',
      desc: 'Button under the sets table to append another set',
      args: [],
    );
  }

  /// `Start Rest Timer ({time})`
  String workoutStartRestTimer(String time) {
    return Intl.message(
      'Start Rest Timer ($time)',
      name: 'workoutStartRestTimer',
      desc: 'Sticky footer call to action that starts the rest countdown',
      args: [time],
    );
  }

  /// `kg`
  String get workoutWeightUnitKg {
    return Intl.message(
      'kg',
      name: 'workoutWeightUnitKg',
      desc: 'Kilogram unit suffix shown beside a weight value',
      args: [],
    );
  }

  /// `Enter Starting Weight`
  String get weightDialogTitle {
    return Intl.message(
      'Enter Starting Weight',
      name: 'weightDialogTitle',
      desc: 'Heading of the starting-weight modal',
      args: [],
    );
  }

  /// `Don't worry, you can update this later whenever you want.`
  String get weightDialogSubtitle {
    return Intl.message(
      'Don\'t worry, you can update this later whenever you want.',
      name: 'weightDialogSubtitle',
      desc: 'Reassurance copy under the starting-weight modal heading',
      args: [],
    );
  }

  /// `Save & Start`
  String get weightDialogSaveStart {
    return Intl.message(
      'Save & Start',
      name: 'weightDialogSaveStart',
      desc:
          'Primary action that stores the entered weight and begins the exercise',
      args: [],
    );
  }

  /// `Not sure? Use default`
  String get weightDialogUseDefault {
    return Intl.message(
      'Not sure? Use default',
      name: 'weightDialogUseDefault',
      desc: 'Secondary action that accepts the suggested default weight',
      args: [],
    );
  }

  /// `What should we call you?`
  String get namePromptTitle {
    return Intl.message(
      'What should we call you?',
      name: 'namePromptTitle',
      desc: 'Heading of the first-visit name bottom sheet',
      args: [],
    );
  }

  /// `Personalize your FitFlow experience. You can change this later.`
  String get namePromptSubtitle {
    return Intl.message(
      'Personalize your FitFlow experience. You can change this later.',
      name: 'namePromptSubtitle',
      desc: 'Supporting copy under the name bottom sheet heading',
      args: [],
    );
  }

  /// `Your name`
  String get namePromptHint {
    return Intl.message(
      'Your name',
      name: 'namePromptHint',
      desc: 'Placeholder text inside the name input field',
      args: [],
    );
  }

  /// `Athlete`
  String get namePromptDefaultName {
    return Intl.message(
      'Athlete',
      name: 'namePromptDefaultName',
      desc:
          'Base word for the auto-generated default name when the field is left blank',
      args: [],
    );
  }

  /// `Health Profile`
  String get profileTitle {
    return Intl.message(
      'Health Profile',
      name: 'profileTitle',
      desc: 'Profile screen top app bar title',
      args: [],
    );
  }

  /// `Member since {date}`
  String profileMemberSince(String date) {
    return Intl.message(
      'Member since $date',
      name: 'profileMemberSince',
      desc: 'Subtitle under the profile name showing the first-seen month/year',
      args: [date],
    );
  }

  /// `ACTIVE GOAL`
  String get profileActiveGoalLabel {
    return Intl.message(
      'ACTIVE GOAL',
      name: 'profileActiveGoalLabel',
      desc: 'Uppercase label on the profile Active Goal card',
      args: [],
    );
  }

  /// `Build Muscle`
  String get profileActiveGoalPlaceholder {
    return Intl.message(
      'Build Muscle',
      name: 'profileActiveGoalPlaceholder',
      desc:
          'Placeholder value on the Active Goal card (no localized goal name is stored offline)',
      args: [],
    );
  }

  /// `FREQUENCY`
  String get profileFrequencyLabel {
    return Intl.message(
      'FREQUENCY',
      name: 'profileFrequencyLabel',
      desc: 'Uppercase label on the profile Frequency card',
      args: [],
    );
  }

  /// `{count} Days/Week`
  String profileFrequencyValue(int count) {
    return Intl.message(
      '$count Days/Week',
      name: 'profileFrequencyValue',
      desc: 'Training frequency value derived from the plan availability days',
      args: [count],
    );
  }

  /// `Preferences & Account`
  String get profilePreferencesHeading {
    return Intl.message(
      'Preferences & Account',
      name: 'profilePreferencesHeading',
      desc: 'Section heading above the preferences/account list',
      args: [],
    );
  }

  /// `Language`
  String get profileLanguageRow {
    return Intl.message(
      'Language',
      name: 'profileLanguageRow',
      desc: 'Preferences row — language',
      args: [],
    );
  }

  /// `Reset Workout Plan`
  String get profileResetPlanRow {
    return Intl.message(
      'Reset Workout Plan',
      name: 'profileResetPlanRow',
      desc: 'Preferences row — reset workout plan',
      args: [],
    );
  }

  /// `Log Out`
  String get profileLogoutRow {
    return Intl.message(
      'Log Out',
      name: 'profileLogoutRow',
      desc: 'Preferences row — log out',
      args: [],
    );
  }

  /// `Delete Account`
  String get profileDeleteAccountRow {
    return Intl.message(
      'Delete Account',
      name: 'profileDeleteAccountRow',
      desc: 'Preferences row — delete account (destructive)',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get profilePrivacyRow {
    return Intl.message(
      'Privacy Policy',
      name: 'profilePrivacyRow',
      desc: 'Legal row — privacy policy',
      args: [],
    );
  }

  /// `Terms of Service`
  String get profileTermsRow {
    return Intl.message(
      'Terms of Service',
      name: 'profileTermsRow',
      desc: 'Legal row — terms of service',
      args: [],
    );
  }

  /// `FitFlow Version {version}`
  String profileVersion(String version) {
    return Intl.message(
      'FitFlow Version $version',
      name: 'profileVersion',
      desc: 'App version footer on the profile screen',
      args: [version],
    );
  }

  /// `Edit photo`
  String get profileEditAvatarSemantics {
    return Intl.message(
      'Edit photo',
      name: 'profileEditAvatarSemantics',
      desc: 'Accessibility label for the avatar edit badge',
      args: [],
    );
  }

  /// `English (US)`
  String get languageEnglish {
    return Intl.message(
      'English (US)',
      name: 'languageEnglish',
      desc: 'Language display name — English (endonym, same in all locales)',
      args: [],
    );
  }

  /// `العربية`
  String get languageArabic {
    return Intl.message(
      'العربية',
      name: 'languageArabic',
      desc: 'Language display name — Arabic (endonym, same in all locales)',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
