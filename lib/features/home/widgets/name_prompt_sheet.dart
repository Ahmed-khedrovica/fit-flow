import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/storage/app_boxes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// First-visit name capture. Shown once the first time the user lands on the
/// home screen (signalled by [AppBoxes.userName] being `null`). Persists the
/// entered name + first-seen date; a blank field falls back to a random name.
Future<void> showNamePromptSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    backgroundColor: AppColors.transparent,
    builder: (_) => const _NamePromptSheet(),
  );
}

class _NamePromptSheet extends StatefulWidget {
  const _NamePromptSheet();

  @override
  State<_NamePromptSheet> createState() => _NamePromptSheetState();
}

class _NamePromptSheetState extends State<_NamePromptSheet> {
  final TextEditingController _controller = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _confirm() async {
    setState(() => _saving = true);

    final entered = _controller.text.trim();
    final name = entered.isNotEmpty
        ? entered
        : '${S.of(context).namePromptDefaultName} ${1000 + Random().nextInt(9000)}';

    await AppBoxes.saveFirstVisitProfile(name);
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 24 + bottomInset),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsetsDirectional.only(bottom: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.neutralChipSurface,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
              Text(s.namePromptTitle, style: AppTextStyles.onboardingTitle()),
              const SizedBox(height: 8),
              Text(s.namePromptSubtitle, style: AppTextStyles.onboardingSubtitle()),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                autofocus: true,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.words,
                cursorColor: AppColors.primary,
                style: AppTextStyles.profileRowTitle(),
                onSubmitted: (_) => _confirm(),
                decoration: InputDecoration(
                  hintText: s.namePromptHint,
                  hintStyle: AppTextStyles.profileRowTitle()
                      .copyWith(color: AppColors.textMuted),
                  filled: true,
                  fillColor: AppColors.subtleFill,
                  contentPadding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 56,
                child: FilledButton(
                  onPressed: _saving ? null : _confirm,
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.surface,
                    shape: const StadiumBorder(),
                  ),
                  child: _saving
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.surface,
                          ),
                        )
                      : Text(
                          s.onboardingContinue,
                          style: AppTextStyles.onboardingContinue(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
