import 'dart:ui';

import 'package:fit_flow/features/home/learn_screen.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../../profile/presentation/screens/profile_screen.dart';
import '../home_screen.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({super.key});

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  int currentIndex = 0;
  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = const [HomeScreen(), LearnScreen(), ProfileScreen()];
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final items = <(IconData, String)>[
      (Icons.home, s.homeNavHome),
      (Icons.menu_book_outlined, s.homeNavLearn),
      (Icons.person_outline, s.homeNavProfile),
    ];
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.scrim,
              border: Border(top: BorderSide(color: AppColors.border)),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 13, 24, 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var i = 0; i < items.length; i++)
                      _NavItem(
                        icon: items[i].$1,
                        label: items[i].$2,
                        selected: i == currentIndex,
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.primary : AppColors.textMuted;
    return InkResponse(
      onTap: onTap,
      radius: 32,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 3),
          Text(
            label,
            style: selected
                ? AppTextStyles.homeNavLabelActive()
                : AppTextStyles.homeNavLabelInactive(),
          ),
        ],
      ),
    );
  }
}
