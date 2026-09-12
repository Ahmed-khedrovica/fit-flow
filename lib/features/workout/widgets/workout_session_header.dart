import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// Sticky top bar for the workout session — close, title, and finish.
class WorkoutSessionHeader extends StatelessWidget {
  const WorkoutSessionHeader({super.key, this.onClose, this.onFinish});

  final VoidCallback? onClose;
  final VoidCallback? onFinish;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.scrim,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 64,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 12, end: 12),
            child: Row(
              children: [
                _CircleIconButton(icon: Icons.close, onTap: onClose),
                const SizedBox(width: 8),
                Text(
                  s.workoutSessionTitle,
                  style: AppTextStyles.workoutHeaderTitle(),
                ),
                const Spacer(),
                TextButton(
                  onPressed: onFinish,
                  child: Text(
                    s.workoutFinish,
                    style: AppTextStyles.workoutFinishButton(),
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

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.icon, this.onTap});

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: onTap,
      radius: 24,
      child: SizedBox(
        width: 40,
        height: 40,
        child: Icon(icon, size: 14, color: AppColors.textPrimary),
      ),
    );
  }
}
