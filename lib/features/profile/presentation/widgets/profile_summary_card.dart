import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:fit_flow/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

/// One bordered card in the profile summary grid — an icon + uppercase label
/// and a bold value (e.g. "ACTIVE GOAL" / "Build Muscle").
class ProfileSummaryCard extends StatelessWidget {
  const ProfileSummaryCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.cardBorderStrong),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: AppColors.profileCardShadow,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(label, style: AppTextStyles.profileCardLabel()),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.homeSectionTitle()),
        ],
      ),
    );
  }
}
