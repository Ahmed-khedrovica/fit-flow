import 'package:flutter/material.dart';

/// Core theme colors. Add new colors here; do not inline in widgets.
class AppColors {
  AppColors._();

  // —— Brand / shared (used across onboarding, home, …)
  /// Fully transparent — system overlay fills, hit areas.
  static const Color transparent = Color(0x00000000);

  /// Primary brand blue (#2563EB) — buttons, active states, brand wordmark.
  static const Color primary = Color(0xFF2563EB);

  /// Deep accent blue (#004AC6) — eyebrows, metric emphasis, badges.
  static const Color accent = Color(0xFF004AC6);

  /// Card / sheet surface (#FFFFFF).
  static const Color surface = Color(0xFFFFFFFF);

  /// App chrome background (#FBFBFB) — app bars, page scaffold.
  static const Color chromeBackground = Color(0xFFFBFBFB);

  /// Translucent chrome scrim — white at 80% (bottom bars, footers).
  static const Color scrim = Color(0xCCFFFFFF);

  /// Hairline border / divider on cards (#F2F2F7).
  static const Color border = Color(0xFFF2F2F7);

  /// Inset surface behind tile icons (#F8FAFC).
  static const Color iconSurface = Color(0xFFF8FAFC);

  /// Neutral grey chip surface (#EEEEEE) — inactive weekday pill, settings
  /// row icon chips.
  static const Color neutralChipSurface = Color(0xFFEEEEEE);

  /// Finished weekday pill background (#22C55E) — completed workout day in
  /// the weekly blueprint.
  static const Color homeDayFinished = Color(0xFF22C55E);

  /// Subtle inset fill / hairline divider (#F3F3F3) — set inputs, table
  /// header, dialog input, settings row dividers.
  static const Color subtleFill = Color(0xFFF3F3F3);

  /// Primary text and icons (#1A1C1C).
  static const Color textPrimary = Color(0xFF1A1C1C);

  /// Secondary caption text (#64748B).
  static const Color textCaption = Color(0xFF64748B);

  /// Muted / disabled text (#94A3B8).
  static const Color textMuted = Color(0xFF94A3B8);

  /// Secondary / muted text (#737686) — sets-table column headers, profile
  /// "Member since", card labels, row values, version footer.
  static const Color secondaryText = Color(0xFF737686);

  // —— Splash
  /// Splash / marketing blue from design (#2563EB).
  static const Color splashBackground = Color(0xFF2563EB);

  /// Primary text and icons on [splashBackground].
  static const Color splashOnPrimary = Color(0xFFFFFFFF);

  /// Tagline on splash — white at 60% opacity.
  static const Color splashTagline = Color(0x99FFFFFF);

  /// Light glass fill — white at 20% (splash home indicator, media play button).
  static const Color glassFillLight = Color(0x33FFFFFF);

  /// Soft drop shadow under splash logo (matches Figma blur ~3, opacity ~10%).
  static const Color splashLogoShadow = Color(0x1A000000);

  // —— Onboarding-specific (Fit Flow Figma)
  static const Color onboardingBackground = Color(0xFFF9F9F9);
  static const Color onboardingTextSecondary = Color(0xFF434655);
  static const Color onboardingRadioBorder = Color(0xFFC3C6D7);

  /// Soft low shadow — black at ~5% (onboarding segment, profile avatar).
  static const Color softShadowLow = Color(0x0D000000);

  // —— Home dashboard (Fit Flow Figma)
  /// Soft [accent] wash at 5% — hero-card glow, active set-row background.
  static const Color accentWash = Color(0x0D004AC6);

  /// Recovery bento tint — mint at 10%.
  static const Color homeRecoveryTint = Color(0x1A6CF8BB);

  /// Recovery bento accent / label (#6CF8BB).
  static const Color homeRecoveryAccent = Color(0xFF6CF8BB);

  /// Weekly-burn bento tint — peach at 10%.
  static const Color homeBurnTint = Color(0x1AFFDBCD);

  /// Weekly-burn bento accent / label (#943700).
  static const Color homeBurnAccent = Color(0xFF943700);

  // —— Workout session (Fit Flow Figma)
  /// Dark media zone backdrop behind the exercise demo (#0F172A).
  static const Color workoutMediaBackground = Color(0xFF0F172A);

  /// Hairline border on the glass media play button — white at 30%.
  static const Color glassBorderLight = Color(0x4DFFFFFF);

  /// Scrim behind media controls (fullscreen) — black at 40%.
  static const Color mediaControlScrim = Color(0x66000000);

  /// Inset field fill — set inputs, table header, dialog input (#F3F3F3).
  static const Color fieldFill = Color(0xFFF3F3F3);

  /// Resting / placeholder value inside a field (#6B7280).
  static const Color inputPlaceholder = Color(0xFF6B7280);

  /// Label tint on filled primary pill buttons (#EEEFFF).
  static const Color primaryButtonLabelTint = Color(0xFFEEEFFF);

  /// Glow under primary pill buttons — [accent] at 20%.
  static const Color primaryButtonShadow = Color(0x33004AC6);

  /// Soft lift above a sticky chrome bar — black at ~3%.
  static const Color chromeBarShadow = Color(0x08000000);

  /// Modal / dialog drop shadow — black at 25%.
  static const Color dialogShadow = Color(0x40000000);

  // —— Profile / settings (Fit Flow Figma)
  /// Stronger card hairline border (#E2E2E2) — profile summary & list cards.
  static const Color cardBorderStrong = Color(0xFFE2E2E2);

  /// Tinted icon chip behind the Language row icon (#DBE1FF).
  static const Color profileIconChipBlue = Color(0xFFDBE1FF);

  /// Destructive action text — "Delete Account" (#BA1A1A).
  static const Color destructive = Color(0xFFBA1A1A);

  /// Destructive icon chip tint — peach at 30% (#FFDAD6 @ 0.3).
  static const Color destructiveTint = Color(0x4DFFDAD6);

  /// Soft drop shadow under the profile summary cards — black at ~2%.
  static const Color profileCardShadow = Color(0x05000000);
}
