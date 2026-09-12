import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../presentation/utils/home_day_utils.dart';
import 'home_section_header.dart';

/// "Weekly Blueprint" section — a card with seven day pills.
class HomeWeeklyBlueprint extends StatelessWidget {
  const HomeWeeklyBlueprint({
    super.key,
    required this.activeSlots,
    required this.currentSlot,
    required this.finishedSlots,
  });

  final List<int?> activeSlots;
  final int? currentSlot;
  final List<int> finishedSlots;

  static const List<String> _weekdayKeys = [
    'homeDaySaturday',
    'homeDaySunday',
    'homeDayMonday',
    'homeDayTuesday',
    'homeDayWednesday',
    'homeDayThursday',
    'homeDayFriday',
  ];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeSectionHeader(
          title: s.homeWeeklyBlueprintTitle,
          trailingLabel: s.homeWeekLabel,
        ),
        const SizedBox(height: 12),
        DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surface,
            border: Border.all(color: AppColors.border),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var i = 0; i < 7; i++)
                  _DayPill(
                    letterKey: _weekdayKeys[i],
                    dateNumber: i + 1,
                    status: finishedSlots.contains(i + 1)
                        ? HomeDayStatus.finished
                        : activeSlots.contains(i)
                            ? HomeDayStatus.active
                            : HomeDayStatus.reset,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DayPill extends StatelessWidget {
  const _DayPill({
    required this.letterKey,
    required this.dateNumber,
    required this.status,
  });

  final String letterKey;
  final int dateNumber;
  final HomeDayStatus status;

  @override
  Widget build(BuildContext context) {
    // Helper to get localized weekday letter from key
    String getLetter(BuildContext context) {
      final s = S.of(context);
      return switch (letterKey) {
        'homeDaySaturday' => s.homeDaySat,
        'homeDaySunday' => s.homeDaySun,
        'homeDayMonday' => s.homeDayMon,
        'homeDayTuesday' => s.homeDayTue,
        'homeDayWednesday' => s.homeDayWed,
        'homeDayThursday' => s.homeDayThu,
        'homeDayFriday' => s.homeDayFri,
        _ => '',
      };
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(getLetter(context), style: AppTextStyles.homeDayLetter()),
        const SizedBox(height: 8),
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: switch (status) {
              HomeDayStatus.active => AppColors.primary,
              HomeDayStatus.finished => AppColors.homeDayFinished,
              HomeDayStatus.reset => AppColors.neutralChipSurface,
            },
          ),
          child: switch (status) {
            HomeDayStatus.active => Text(
              '$dateNumber',
              style: AppTextStyles.homeDayNumberActive(),
            ),
            HomeDayStatus.finished => Text(
              '$dateNumber',
              style: AppTextStyles.homeDayNumberActive(),
            ),
            HomeDayStatus.reset => Text(
              '$dateNumber',
              style: AppTextStyles.homeDayNumberInactive(),
            ),
          },
        ),
      ],
    );
  }
}
