import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'onboarding_recommended_card.dart';
import 'onboarding_weekly_selector.dart';

class OnboardingFrequencySection extends StatefulWidget {
  const OnboardingFrequencySection({
    super.key,
    required this.labels,
    this.initialIndex = 1,
    this.onChanged,
  });

  final List<String> labels;
  final int initialIndex;
  final ValueChanged<int>? onChanged;

  @override
  State<OnboardingFrequencySection> createState() =>
      _OnboardingFrequencySectionState();
}

class _OnboardingFrequencySectionState
    extends State<OnboardingFrequencySection> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onSelectionChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final showRecommended = _selectedIndex == 1;

    return Column(
      children: [
        OnboardingWeeklySelector(
          labels: widget.labels,
          initialIndex: _selectedIndex,
          onChanged: _onSelectionChanged,
        ),
        if (showRecommended) ...[
          const SizedBox(height: 16),
          OnboardingRecommendedCard(
            badgeLabel: s.onboardingRecommendedLabel,
            caption: s.onboardingRecommendedCaption,
          ),
        ],
      ],
    );
  }
}
