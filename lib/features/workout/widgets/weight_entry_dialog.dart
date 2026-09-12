import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';

/// Shows the "Enter Starting Weight" modal (Figma 280:116).
///
/// Always resolves to a weight in kg: the value the user typed via
/// "Save & Start", or [defaultWeight] if they tapped "Use default" or the
/// dialog was dismissed.
Future<double> showWeightEntryDialog(
  BuildContext context, {
  required double defaultWeight,
}) async {
  final result = await showDialog<double>(
    context: context,
    barrierDismissible: false,
    builder: (_) => _WeightEntryDialog(defaultWeight: defaultWeight),
  );
  return result ?? defaultWeight;
}

class _WeightEntryDialog extends StatefulWidget {
  const _WeightEntryDialog({required this.defaultWeight});

  final double defaultWeight;

  @override
  State<_WeightEntryDialog> createState() => _WeightEntryDialogState();
}

class _WeightEntryDialogState extends State<_WeightEntryDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _format(widget.defaultWeight));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _format(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toString();

  void _saveAndStart() {
    final parsed = double.tryParse(_controller.text.trim());
    Navigator.of(context).pop(
      (parsed != null && parsed > 0) ? parsed : widget.defaultWeight,
    );
  }

  void _useDefault() => Navigator.of(context).pop(widget.defaultWeight);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: AppColors.dialogShadow,
              offset: Offset(0, 25),
              blurRadius: 50,
              spreadRadius: -12,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                s.weightDialogTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.dialogTitle(),
              ),
              const SizedBox(height: 8),
              Text(
                s.weightDialogSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.dialogSubtitle(),
              ),
              const SizedBox(height: 24),
              _WeightField(
                controller: _controller,
                unit: s.workoutWeightUnitKg,
                onSubmitted: (_) => _saveAndStart(),
              ),
              const SizedBox(height: 32),
              _PrimaryButton(
                label: s.weightDialogSaveStart,
                onTap: _saveAndStart,
              ),
              const SizedBox(height: 12),
              _TextActionButton(
                label: s.weightDialogUseDefault,
                onTap: _useDefault,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeightField extends StatelessWidget {
  const _WeightField({
    required this.controller,
    required this.unit,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String unit;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.subtleFill,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: TextField(
                controller: controller,
                autofocus: true,
                expands: true,
                maxLines: null,
                minLines: null,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                onSubmitted: onSubmitted,
                style: AppTextStyles.dialogWeightInput(),
                cursorColor: AppColors.primary,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                  contentPadding: EdgeInsetsDirectional.only(
                    start: 12,
                    end: 27,
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              end: 24,
              top: 0,
              bottom: 0,
              child: Center(
                child: Text(unit, style: AppTextStyles.dialogWeightUnit()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(9999),
        boxShadow: const [
          BoxShadow(
            color: AppColors.primaryButtonShadow,
            offset: Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9999),
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(label, style: AppTextStyles.homeHeroButton()),
          ),
        ),
      ),
    );
  }
}

class _TextActionButton extends StatelessWidget {
  const _TextActionButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(9999),
      child: SizedBox(
        height: 48,
        child: Center(
          child: Text(label, style: AppTextStyles.dialogSubtitle()),
        ),
      ),
    );
  }
}
