import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/app_boxes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../presentation/cubit/workout_session_cubit.dart';

/// Sticky bottom action bar — the "Start Rest Timer" primary CTA.
///
/// The timer can only be started after the user completes a *new* set since the
/// last time it was started (per exercise), so the rest timer follows a logged
/// set instead of being spammable. When no new set is available the button is
/// greyed out and tapping it does nothing.
class WorkoutFooterBar extends StatefulWidget {
  const WorkoutFooterBar({
    super.key,
    required this.exerciseId,
    required this.restSeconds,
  });

  /// Id of the exercise currently shown — used to read its completed-set count
  /// from Hive and gate the timer per exercise.
  final String exerciseId;

  final int restSeconds;

  @override
  State<WorkoutFooterBar> createState() => _WorkoutFooterBarState();
}

class _WorkoutFooterBarState extends State<WorkoutFooterBar> {
  Timer? _timer;
  int? _remainingSeconds;

  /// Completed-set count captured the last time the timer was started. In-memory
  /// and per session — a fresh launch lets the user time their first set again.
  int _startedAtCount = 0;

  bool get _isRunning => _remainingSeconds != null;

  int get _displaySeconds => _remainingSeconds ?? widget.restSeconds;

  /// True when a new set has been completed since the timer was last started
  /// (also false before any set is done, and robust to undo).
  bool get _canStart =>
      AppBoxes.setProgress(widget.exerciseId) > _startedAtCount;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  void _onPressed() {
    if (_isRunning) return;
    if (!_canStart) return;

    _startedAtCount = AppBoxes.setProgress(widget.exerciseId);
    _cancelTimer();
    setState(() => _remainingSeconds = widget.restSeconds);
    context.read<WorkoutSessionCubit>().timerStarted();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      final left = _remainingSeconds;
      if (left == null) {
        timer.cancel();
        return;
      }
      if (left == 0) {
        _cancelTimer();
        setState(() => _remainingSeconds = null);
        context.read<WorkoutSessionCubit>().timerStopped();
        return;
      }
      setState(() => _remainingSeconds = left - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final timeLabel = _formatMmSs(_displaySeconds);

    // Rebuilds whenever the sets table reports completed-set progress, so the
    // timer gate (`_canStart`) is re-evaluated as soon as a set is logged.
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, _) {
        // A running timer always renders active; otherwise the button is only
        // enabled once a new set has been completed.
        final enabled = _isRunning || _canStart;
        final fill = enabled ? AppColors.primary : AppColors.neutralChipSurface;
        final foreground = enabled
            ? AppColors.primaryButtonLabelTint
            : AppColors.textMuted;

        return DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.scrim,
            border: Border(top: BorderSide(color: AppColors.border)),
            boxShadow: [
              BoxShadow(
                color: AppColors.chromeBarShadow,
                offset: Offset(0, -4),
                blurRadius: 12,
              ),
            ],
          ),
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 17, 20, 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: fill,
                  borderRadius: BorderRadius.circular(9999),
                  boxShadow: enabled
                      ? const [
                          BoxShadow(
                            color: AppColors.primaryButtonShadow,
                            offset: Offset(0, 10),
                            blurRadius: 15,
                            spreadRadius: -3,
                          ),
                        ]
                      : null,
                ),
                child: InkWell(
                  onTap: _onPressed,
                  borderRadius: BorderRadius.circular(9999),
                  child: SizedBox(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.timer_outlined, size: 18, color: foreground),
                        const SizedBox(width: 12),
                        Text(
                          _isRunning
                              ? timeLabel
                              : s.workoutStartRestTimer(timeLabel),
                          style: AppTextStyles.workoutFooterButton().copyWith(
                            color: foreground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

String _formatMmSs(int totalSeconds) {
  final m = totalSeconds ~/ 60;
  final s = totalSeconds % 60;
  return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
}
