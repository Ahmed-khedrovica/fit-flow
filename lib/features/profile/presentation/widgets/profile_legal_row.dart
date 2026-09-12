import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:fit_flow/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';



/// A row in the legal card — a title and an external-link affordance.
/// UI-only; [onTap] is wired by the caller (no-op for now).
class ProfileLegalRow extends StatelessWidget {
  const ProfileLegalRow({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(title, style: AppTextStyles.profileLegalRow()),
            ),
            const Icon(
              Icons.open_in_new,
              size: 18,
              color: AppColors.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}
