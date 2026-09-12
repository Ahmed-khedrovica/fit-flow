import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Material app bar for onboarding; pass to [Scaffold.appBar].
class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
    required this.brandLabel,
    required this.helpSemanticsLabel,
    this.trailing,
  });

  final String brandLabel;
  final String helpSemanticsLabel;
  final Widget? trailing;

  static const double _toolbarHeight = kToolbarHeight;
  static const double _bottomDividerHeight = 1;

  @override
  Size get preferredSize =>
      const Size.fromHeight(_toolbarHeight + _bottomDividerHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.chromeBackground,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      toolbarHeight: _toolbarHeight,
      titleSpacing: 24,
      title: Text(brandLabel, style: AppTextStyles.onboardingHeaderBrand()),
      actions: [
        ?trailing,
      ],
      actionsPadding: const EdgeInsetsDirectional.only(end: 24),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(_bottomDividerHeight),
        child: Divider(
          height: _bottomDividerHeight,
          thickness: _bottomDividerHeight,
          color: AppColors.border,
        ),
      ),
    );
  }
}
