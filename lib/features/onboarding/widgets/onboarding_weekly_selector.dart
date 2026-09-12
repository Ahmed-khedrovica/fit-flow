import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

/// Segmented training days control (Figma: Weekly Availability).
class OnboardingWeeklySelector extends StatefulWidget {
  const OnboardingWeeklySelector({
    super.key,
    required this.labels,
    this.initialIndex = 1,
    this.onChanged,
  });

  final List<String> labels;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  @override
  State<OnboardingWeeklySelector> createState() =>
      _OnboardingWeeklySelectorState();
}

class _OnboardingWeeklySelectorState extends State<OnboardingWeeklySelector> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onTap(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: List.generate(widget.labels.length, (index) {
          final selected = index == _selectedIndex;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: selected
                    ? AppColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                boxShadow: selected
                    ? const [
                        BoxShadow(
                          color: AppColors.softShadowLow,
                          offset: Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _onTap(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: Text(
                        widget.labels[index],
                        style: selected
                            ? AppTextStyles.onboardingSegmentSelected()
                            : AppTextStyles.onboardingSegmentUnselected(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
