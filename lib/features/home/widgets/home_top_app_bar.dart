import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// Fixed 64dp home header: greeting block + settings button, with a hairline
/// bottom divider. Matches the Fit Flow "Header - TopAppBar" Figma node.
class HomeTopAppBar extends StatelessWidget {
  const HomeTopAppBar({super.key});

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
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.homeGreeting, style: AppTextStyles.homeGreeting()),
                      const SizedBox(height: 2),
                      Text(
                        s.homeGreetingSubtitle,
                        style: AppTextStyles.homeGreetingSubtitle(),
                      ),
                    ],
                  ),
                ),
                _SettingsButton(semanticsLabel: s.homeSettingsSemantics),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({required this.semanticsLabel}) : onPressed = null;

  final String semanticsLabel;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
        onPressed: onPressed,
        tooltip: semanticsLabel,
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.wb_sunny_outlined,
          size: 20,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
