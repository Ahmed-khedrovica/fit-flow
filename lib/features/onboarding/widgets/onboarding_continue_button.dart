import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../presentation/cubit/plan_cubit.dart';

class OnboardingContinueButton extends StatelessWidget {
  const OnboardingContinueButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<PlanCubit, PlanState>(
      builder: (context, state) {
        final isLoading = state is PlanLoading;
        return FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.surface,
            minimumSize: const Size.fromHeight(56),
            shape: const StadiumBorder(),
            elevation: 0,
          ),
          onPressed: isLoading ? null : onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.surface,
                    ),
                  ),
                ),
              Text(
                s.onboardingContinue,
                style: AppTextStyles.onboardingContinue(),
              ),
              if (!isLoading) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.surface,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
