import 'package:fit_flow/core/storage/app_boxes.dart';
import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:fit_flow/core/theme/app_text_styles.dart';
import 'package:fit_flow/core/widgets/lan_picker_bottom_sheet.dart';
import 'package:fit_flow/features/onboarding/onboarding_screen.dart';
import 'package:fit_flow/features/profile/presentation/widgets/profile_legal_row.dart';
import 'package:fit_flow/features/profile/presentation/widgets/profile_settings_row.dart';
import 'package:fit_flow/features/profile/presentation/widgets/profile_summary_card.dart';
import 'package:fit_flow/features/profile/presentation/widgets/profile_top_app_bar.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';




/// URL opened by the Privacy Policy and Terms of Service rows.
const _legalUrl = 'https://ahmed-khedrovica.github.io/';

/// Health Profile screen — matches the Fit Flow "Profile & Settings" Figma
/// frame. Name, "Member since", frequency and language are populated from
/// local storage.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Static for now — no package metadata source wired (UI-only).
  static const String _appVersion = '2.4.1 (882)';

  String? _memberSince() {
    final iso = AppBoxes.firstSeenDate;
    if (iso == null) return null;
    final date = DateTime.tryParse(iso);
    if (date == null) return null;
    String formatted;
    try {
      formatted = DateFormat.yMMMM(AppBoxes.localeCode).format(date);
    } catch (_) {
      formatted = DateFormat.yMMMM().format(date);
    }
    return S.of(context).profileMemberSince(formatted);
  }

  void _goToOnboarding() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (_) => const OnboardingScreen(),
      ),
      (_) => false,
    );
  }

  Future<void> _resetPlan() async {
    final s = S.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(s.profileResetPlanRow),
        content: const Text(
          'This will delete your current workout plan and let you '
          'pick a new one. Your progress will be reset.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'Reset',
              style: TextStyle(color: Theme.of(ctx).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await AppBoxes.resetPlan();
    if (!mounted) return;
    _goToOnboarding();
  }

  Future<void> _logout() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Log out'),
        content: const Text(
          'You will be returned to the setup screen. '
          'Your workout progress will be cleared.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Log out'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await AppBoxes.clearAll();
    if (!mounted) return;
    _goToOnboarding();
  }

  Future<void> _deleteAccount() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'All your data will be permanently deleted. '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(ctx).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await AppBoxes.clearAll();
    if (!mounted) return;
    _goToOnboarding();
  }

  Future<void> _openLegalUrl() async {
    final uri = Uri.parse(_legalUrl);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final plan = AppBoxes.plan;

    final name = AppBoxes.userName ?? '';
    final memberSince = _memberSince();
    final frequencyValue = plan != null
        ? s.profileFrequencyValue(plan.availabilityDays)
        : '—';
    final languageValue =
        AppBoxes.localeCode == 'ar' ? s.languageArabic : s.languageEnglish;

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
            ProfileTopAppBar(onSettingsPressed: () {}),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _UserOverview(name: name, memberSince: memberSince),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProfileSummaryCard(
                            icon: Icons.track_changes,
                            label: s.profileActiveGoalLabel,
                            value: s.profileActiveGoalPlaceholder,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ProfileSummaryCard(
                            icon: Icons.calendar_today,
                            label: s.profileFrequencyLabel,
                            value: frequencyValue,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 8),
                      child: Text(
                        s.profilePreferencesHeading.toUpperCase(),
                        style: AppTextStyles.profileCardLabel(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ProfileSettingsRow(
                            icon: Icons.language,
                            chipColor: AppColors.profileIconChipBlue,
                            iconColor: AppColors.primary,
                            title: s.profileLanguageRow,
                            titleStyle: AppTextStyles.profileRowTitle(),
                            trailingValue: languageValue,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) =>
                                    const LanguagePickerBottomSheet(),
                              );
                            },
                          ),
                          ProfileSettingsRow(
                            icon: Icons.refresh,
                            chipColor: AppColors.neutralChipSurface,
                            iconColor: AppColors.textPrimary,
                            title: s.profileResetPlanRow,
                            titleStyle: AppTextStyles.profileRowTitle(),
                            onTap: _resetPlan,
                          ),
                          ProfileSettingsRow(
                            icon: Icons.logout,
                            chipColor: AppColors.neutralChipSurface,
                            iconColor: AppColors.textPrimary,
                            title: s.profileLogoutRow,
                            titleStyle: AppTextStyles.profileRowTitle(),
                            onTap: _logout,
                          ),
                          ProfileSettingsRow(
                            icon: Icons.delete_outline,
                            chipColor: AppColors.destructiveTint,
                            iconColor: AppColors.destructive,
                            title: s.profileDeleteAccountRow,
                            titleStyle: AppTextStyles.profileRowDestructive(),
                            showDivider: false,
                            onTap: _deleteAccount,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ProfileLegalRow(
                            title: s.profilePrivacyRow,
                            onTap: _openLegalUrl,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: AppColors.subtleFill,
                          ),
                          ProfileLegalRow(
                            title: s.profileTermsRow,
                            onTap: _openLegalUrl,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        s.profileVersion(_appVersion),
                        style: AppTextStyles.profileSecondary(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        //bottomNavigationBar: const HomeBottomNav(currentIndex: 2),
      ),
    );
  }
}


/// Avatar + name + "Member since" block, horizontally centered.
class _UserOverview extends StatelessWidget {
  const _UserOverview({required this.name, required this.memberSince});

  final String name;
  final String? memberSince;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      children: [
        SizedBox(
          width: 96,
          height: 96,
          child: Stack(
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.neutralChipSurface,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surface, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.softShadowLow,
                      blurRadius: 2,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.person,
                  size: 48,
                  color: AppColors.secondaryText,
                ),
              ),
              PositionedDirectional(
                end: 0,
                bottom: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.surface, width: 3),
                  ),
                  alignment: Alignment.center,
                  child: Tooltip(
                    message: s.profileEditAvatarSemantics,
                    child: const Icon(
                      Icons.edit,
                      size: 12,
                      color: AppColors.surface,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          textAlign: TextAlign.center,
          style: AppTextStyles.homeHeroTitle(),
        ),
        if (memberSince != null) ...[
          const SizedBox(height: 4),
          Text(
            memberSince!,
            textAlign: TextAlign.center,
            style: AppTextStyles.profileSecondary(),
          ),
        ],
      ],
    );
  }
}

/// White rounded card with the stronger hairline border used for the
/// preferences and legal groups.
class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.cardBorderStrong),
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
