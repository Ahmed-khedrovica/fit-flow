import 'package:fit_flow/core/cubit/locale_cubit.dart';
import 'package:fit_flow/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagePickerBottomSheet extends StatelessWidget {
  const LanguagePickerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              'Choose Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),

            const SizedBox(height: 20),

            RadioGroup<String>(
              groupValue: currentLanguage,
              onChanged: (value) {
                if (value == null || value == currentLanguage) {
                  return;
                }

                context.read<LocaleCubit>().changeLocale(value);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  _LanguageOption(
                    value: 'en',
                    title: 'English',
                    subtitle: 'English',
                    currentLanguage: currentLanguage,
                  ),
                  const SizedBox(height: 10),
                  _LanguageOption(
                    value: 'ar',
                    title: 'العربية',
                    subtitle: 'Arabic',
                    currentLanguage: currentLanguage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.value,
    required this.title,
    required this.subtitle,
    required this.currentLanguage,
  });

  final String value;
  final String title;
  final String subtitle;
  final String currentLanguage;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == currentLanguage;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.08)
            : AppColors.transparent,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: RadioListTile<String>(
        value: value,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        activeColor: AppColors.primary,
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 13, color: AppColors.textMuted),
        ),
      ),
    );
  }
}
