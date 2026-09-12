import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';

/// Section heading row: a bold title with an optional accent label trailing it
/// (e.g. "Weekly Blueprint" + "Week 1").
class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title, this.trailingLabel});

  final String title;
  final String? trailingLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(title, style: AppTextStyles.homeSectionTitle()),
        ),
        if (trailingLabel != null)
          Text(trailingLabel!, style: AppTextStyles.homeAccentLabel()),
      ],
    );
  }
}
