import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:fit_flow/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';



/// A single tappable row in the "Preferences & Account" card: a tinted icon
/// chip, a title, an optional trailing value, and a chevron. UI-only — [onTap]
/// is wired by the caller (no-op for now).
class ProfileSettingsRow extends StatelessWidget {
  const ProfileSettingsRow({
    super.key,
    required this.icon,
    required this.chipColor,
    required this.iconColor,
    required this.title,
    required this.titleStyle,
    this.trailingValue,
    this.showDivider = true,
    this.onTap,
  });

  final IconData icon;
  final Color chipColor;
  final Color iconColor;
  final String title;
  final TextStyle titleStyle;
  final String? trailingValue;
  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: chipColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Icon(icon, size: 16, color: iconColor),
                ),
                const SizedBox(width: 12),
                Expanded(child: Text(title, style: titleStyle)),
                if (trailingValue != null) ...[
                  Text(trailingValue!, style: AppTextStyles.profileSecondary()),
                  const SizedBox(width: 8),
                ],
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                  color: AppColors.secondaryText,
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 1,
            color: AppColors.subtleFill,
          ),
      ],
    );
  }
}
