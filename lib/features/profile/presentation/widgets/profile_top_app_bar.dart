import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:fit_flow/core/theme/app_text_styles.dart';
import 'package:fit_flow/generated/l10n.dart';
import 'package:flutter/material.dart';



/// Fixed 64dp profile header: avatar + "Health Profile" title + settings
/// button, with a hairline bottom divider. Matches the Fit Flow
/// "Header - Top App Bar" node on the Profile & Settings frame.
class ProfileTopAppBar extends StatelessWidget {
  const ProfileTopAppBar({super.key, this.onSettingsPressed});

  final VoidCallback? onSettingsPressed;

  static const double height = 64;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.chromeBackground,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.neutralChipSurface,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.person,
                    size: 18,
                    color: AppColors.secondaryText,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    s.profileTitle,
                    style: AppTextStyles.homeSectionTitle(),
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
