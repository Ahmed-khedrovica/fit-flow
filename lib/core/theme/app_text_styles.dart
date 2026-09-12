import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Typography tokens. Prefer these over ad-hoc [TextStyle]s in widgets.
class AppTextStyles {
  AppTextStyles._();

  /// Splash brand wordmark — Lexend bold 48px per design.
  static TextStyle splashBrandTitle() => GoogleFonts.lexend(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 1,
        letterSpacing: -1.2,
        color: AppColors.splashOnPrimary,
      );

  /// Splash tagline — Lexend light 14px, wide tracking, uppercase in copy.
  static TextStyle splashTagline() => GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        height: 20 / 14,
        letterSpacing: 2.8,
        color: AppColors.splashTagline,
      );

  // —— Onboarding
  static TextStyle onboardingHeaderBrand() => GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
        letterSpacing: -0.5,
        color: AppColors.primary,
      );

  static TextStyle onboardingTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        height: 42.5 / 34,
        letterSpacing: -0.85,
        color: AppColors.textPrimary,
      );

  static TextStyle onboardingSubtitle() => GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        height: 22.5 / 15,
        color: AppColors.onboardingTextSecondary,
      );

  static TextStyle onboardingGoalTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 24 / 16,
        color: AppColors.textPrimary,
      );

  static TextStyle onboardingGoalBody() => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 19.5 / 13,
        color: AppColors.onboardingTextSecondary,
      );

  static TextStyle onboardingSectionTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 28 / 18,
        letterSpacing: -0.45,
        color: AppColors.textPrimary,
      );

  static TextStyle onboardingSegmentSelected() => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 19.5 / 13,
        color: AppColors.surface,
      );

  static TextStyle onboardingSegmentUnselected() => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        height: 19.5 / 13,
        color: AppColors.textMuted,
      );

  static TextStyle onboardingRecommendedBadge() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 15 / 10,
        letterSpacing: 1,
        color: AppColors.primary,
      );

  static TextStyle onboardingRecommendedCaption() => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16.5 / 11,
        color: AppColors.textCaption,
      );

  static TextStyle onboardingContinue() => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        height: 25.5 / 17,
        color: AppColors.surface,
      );

  static TextStyle onboardingDisclaimer() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 15 / 10,
        letterSpacing: 1,
        color: AppColors.textMuted,
      );

  // —— Home dashboard
  /// Header greeting — "Good Morning".
  static TextStyle homeGreeting() => GoogleFonts.plusJakartaSans(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 28 / 20,
        letterSpacing: -0.5,
        color: AppColors.primary,
      );

  /// Header sub-greeting — "Let's get to work.".
  static TextStyle homeGreetingSubtitle() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 18 / 12,
        color: AppColors.textCaption,
      );

  /// Section heading — "Weekly Blueprint" / "Today's Exercises".
  static TextStyle homeSectionTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 24 / 18,
        color: AppColors.textPrimary,
      );

  /// Accent label aligned to a section heading — "Week 1".
  static TextStyle homeAccentLabel() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.6,
        color: AppColors.accent,
      );

  /// Weekday initials in the blueprint strip — "M T W …".
  static TextStyle homeDayLetter() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.6,
        color: AppColors.textMuted,
      );

  /// Date numeral inside an active (filled) day pill.
  static TextStyle homeDayNumberActive() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: AppColors.surface,
      );

  /// Date numeral inside an inactive day pill.
  static TextStyle homeDayNumberInactive() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: AppColors.textMuted,
      );

  /// Uppercase eyebrow inside the hero card — "ACTIVE PLAN".
  static TextStyle homeHeroEyebrow() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 1.2,
        color: AppColors.accent,
      );

  /// Hero card title — "Upper Body Basics".
  static TextStyle homeHeroTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 34,
        fontWeight: FontWeight.w800,
        height: 41 / 34,
        letterSpacing: -0.68,
        color: AppColors.textPrimary,
      );

  /// Hero card meta — "45 Minutes" / "4 Exercises".
  static TextStyle homeHeroMeta() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.textCaption,
      );

  /// Hero call-to-action label — "Start Workout".
  static TextStyle homeHeroButton() => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.surface,
      );

  /// Exercise tile title — "Dumbbell Bench Press".
  static TextStyle homeExerciseTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.textPrimary,
      );

  /// Exercise tile target group — "Chest & Triceps".
  static TextStyle homeExerciseSubtitle() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.textMuted,
      );

  /// Exercise tile set/rep figure — "3 x 8-10".
  static TextStyle homeExerciseReps() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: AppColors.accent,
      );

  /// Uppercase "REPS" caption under the set/rep figure.
  static TextStyle homeExerciseRepsLabel() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 15 / 10,
        color: AppColors.textMuted,
      );

  /// Bento stat label — "RECOVERY" / "WEEKLY BURN" (color set per usage).
  static TextStyle homeStatLabel() => GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 15 / 10,
        color: AppColors.textMuted,
      );

  /// Bento stat value — "94%" / "2,450".
  static TextStyle homeStatValue() => GoogleFonts.plusJakartaSans(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 28 / 18,
        color: AppColors.textPrimary,
      );

  /// Bento stat supporting copy.
  static TextStyle homeStatBody() => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 16.5 / 11,
        color: AppColors.textCaption,
      );

  /// Bottom-nav label, selected tab.
  static TextStyle homeNavLabelActive() => GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16.5 / 11,
        letterSpacing: 0.275,
        color: AppColors.primary,
      );

  /// Bottom-nav label, unselected tab.
  static TextStyle homeNavLabelInactive() => GoogleFonts.plusJakartaSans(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16.5 / 11,
        letterSpacing: 0.275,
        color: AppColors.textMuted,
      );

  // —— Workout session
  /// Session header title — "Workout Session".
  static TextStyle workoutHeaderTitle() => GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        letterSpacing: -0.35,
        color: AppColors.textPrimary,
      );

  /// Session header trailing action — "Finish".
  static TextStyle workoutFinishButton() => GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: AppColors.primary,
      );

  /// "FORM CUES" label and each cue line.
  static TextStyle workoutFormCue() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.onboardingTextSecondary,
      );

  /// Sets-table column headers — "SET / WEIGHT / REPS / DONE".
  static TextStyle workoutTableHeader() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.secondaryText,
      );

  /// Set index in a logging row (active row uses .copyWith accent).
  static TextStyle workoutSetNumber() => GoogleFonts.plusJakartaSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.textPrimary,
      );

  /// Resting value inside a weight/reps pill — "25kg" / "12".
  static TextStyle workoutInputValue() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1,
        color: AppColors.inputPlaceholder,
      );

  /// Value inside an active (focused) weight/reps pill.
  static TextStyle workoutInputValueActive() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
        color: AppColors.accent,
      );

  /// "ADD SET" table footer action.
  static TextStyle workoutAddSet() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.accent,
      );

  /// Sticky footer CTA — "Start Rest Timer (01:30)".
  static TextStyle workoutFooterButton() => GoogleFonts.plusJakartaSans(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.primaryButtonLabelTint,
      );

  // —— Dialog (Enter Starting Weight)
  /// Modal heading — "Enter Starting Weight".
  static TextStyle dialogTitle() => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 32 / 24,
        color: AppColors.textPrimary,
      );

  /// Modal supporting copy and the "Not sure? Use default" action.
  static TextStyle dialogSubtitle() => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.onboardingTextSecondary,
      );

  /// Large weight value typed into the modal input — "25".
  static TextStyle dialogWeightInput() => GoogleFonts.inter(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        height: 1,
        color: AppColors.inputPlaceholder,
      );

  /// Unit suffix beside the modal weight input — "kg".
  static TextStyle dialogWeightUnit() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
        color: AppColors.onboardingTextSecondary,
      );

  // —— Profile / settings
  /// Secondary profile copy — "Member since …", row trailing value,
  /// version footer.
  static TextStyle profileSecondary() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.secondaryText,
      );

  /// Uppercase card / section label — "ACTIVE GOAL", "PREFERENCES & ACCOUNT".
  static TextStyle profileCardLabel() => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.6,
        color: AppColors.secondaryText,
      );

  /// Settings row title — "Language", "Reset Workout Plan", "Log Out".
  static TextStyle profileRowTitle() => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 24 / 17,
        color: AppColors.textPrimary,
      );

  /// Destructive settings row title — "Delete Account".
  static TextStyle profileRowDestructive() => GoogleFonts.inter(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        height: 24 / 17,
        color: AppColors.destructive,
      );

  /// Legal-card row — "Privacy Policy", "Terms of Service".
  static TextStyle profileLegalRow() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.textPrimary,
      );
}
