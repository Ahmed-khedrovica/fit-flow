import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/app_boxes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../generated/l10n.dart';
import '../presentation/cubit/workout_session_cubit.dart';

/// Visual / interaction state of a single set's done button.
enum _SetState {
  /// Already logged. Renders filled green; tappable only for the most recent
  /// one (to undo).
  completed,

  /// The next set to log — the only one that completes on tap.
  active,

  /// Not yet reachable; rendered muted and non-interactive.
  locked,
}

/// Frictionless logging table — column headers, one row per set, and an
/// "ADD SET" action. Sets are completed sequentially: only the next pending
/// set is tappable, and the most recently completed set can be tapped to undo.
/// Progress is tracked via the count of completed sets, persisted per exercise
/// in Hive so it survives page rebuilds and app launches.
class WorkoutSetsTable extends StatefulWidget {
  const WorkoutSetsTable({
    super.key,
    required this.exerciseId,
    required this.sets,
    required this.reps,
    required this.weightLabel,
    this.onAddSet,
  });

  /// Stable id used to persist completed-set progress in Hive.
  final String exerciseId;

  /// Number of working sets for the exercise.
  final int sets;

  /// Rep target text (e.g. "12" or "8-10").
  final String reps;

  /// Pre-filled weight text shown in every WEIGHT pill (e.g. "25kg").
  final String weightLabel;

  final VoidCallback? onAddSet;

  @override
  State<WorkoutSetsTable> createState() => _WorkoutSetsTableState();
}

class _WorkoutSetsTableState extends State<WorkoutSetsTable> {
  /// How many sets are completed — equivalently the last completed 1-based
  /// index (0 = none done). Seeded from Hive and persisted on every change.
  late int _completedCount;

  /// Mutable set count — starts from [widget.sets] and grows when the user
  /// taps "Add Set".
  late int _sets;

  @override
  void initState() {
    super.initState();
    _sets = widget.sets;
    _completedCount = AppBoxes.setProgress(
      widget.exerciseId,
    ).clamp(0, _sets);
  }

  _SetState _stateFor(int index) {
    if (index <= _completedCount) return _SetState.completed;
    if (index == _completedCount + 1) return _SetState.active;
    return _SetState.locked;
  }

  void _addSet() {
    setState(() => _sets++);
    widget.onAddSet?.call();
  }

  void _handleTap(int index) {
    if (index == _completedCount + 1) {
      setState(() => _completedCount++);
    } else if (index == _completedCount) {
      setState(() => _completedCount--);
    } else {
      return;
    }
    AppBoxes.setSetProgress(widget.exerciseId, _completedCount);
    context.read<WorkoutSessionCubit>().notifyProgressChanged();
  }


  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    // While the rest timer is running the table swallows all gestures, so no
    // set can be logged until the rest finishes.
    return BlocBuilder<WorkoutSessionCubit, WorkoutSessionState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is WorkoutTimerRunning,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.surface,
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _HeaderRow(
                    set: s.workoutTableSet,
                    weight: s.workoutTableWeight,
                    reps: s.workoutTableReps,
                    done: s.workoutTableDone,
                  ),
                  for (var i = 1; i <= _sets; i++)
                    _SetRow(
                      index: i,
                      weightLabel: widget.weightLabel,
                      reps: widget.reps,
                      showDivider: i > 1,
                      state: _stateFor(i),
                      onTap: () => _handleTap(i),
                    ),
                  _AddSetButton(label: s.workoutAddSet, onTap: _addSet),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({
    required this.set,
    required this.weight,
    required this.reps,
    required this.done,
  });

  final String set;
  final String weight;
  final String reps;
  final String done;

  @override
  Widget build(BuildContext context) {
    final style = AppTextStyles.workoutTableHeader();
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.subtleFill,
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 13),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(set, style: style)),
          Expanded(
            flex: 2,
            child: Text(weight, style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: Text(reps, style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 1,
            child: Text(done, style: style, textAlign: TextAlign.end),
          ),
        ],
      ),
    );
  }
}

class _SetRow extends StatelessWidget {
  const _SetRow({
    required this.index,
    required this.weightLabel,
    required this.reps,
    required this.showDivider,
    required this.state,
    required this.onTap,
  });

  final int index;
  final String weightLabel;
  final String reps;
  final bool showDivider;
  final _SetState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: showDivider
            ? const Border(top: BorderSide(color: AppColors.border))
            : null,
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 16),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text('$index', style: AppTextStyles.workoutSetNumber()),
          ),
          Expanded(
            flex: 2,
            child: Center(child: _Pill(label: weightLabel)),
          ),
          Expanded(
            flex: 2,
            child: Center(child: _Pill(label: reps)),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: _DoneButton(state: state, onTap: onTap),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 80),
      height: 40,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.subtleFill,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Text(
        label,
        style: AppTextStyles.workoutInputValue(),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _DoneButton extends StatelessWidget {
  const _DoneButton({required this.state, required this.onTap});

  final _SetState state;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Locked sets are not yet reachable; the rest react to taps (complete /
    // undo) handled by the parent table.
    final tappable = state != _SetState.locked;

    final Color fill;
    final Color outline;
    final Color iconColor;
    switch (state) {
      case _SetState.completed:
        fill = AppColors.homeDayFinished;
        outline = AppColors.homeDayFinished;
        iconColor = AppColors.surface;
      case _SetState.active:
        fill = AppColors.transparent;
        outline = AppColors.primary;
        iconColor = AppColors.primary;
      case _SetState.locked:
        fill = AppColors.transparent;
        outline = AppColors.textMuted;
        iconColor = AppColors.textMuted;
    }

    return GestureDetector(
      onTap: tappable ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: fill,
          border: Border.all(color: outline, width: 2),
          borderRadius: BorderRadius.circular(9999),
        ),
        child: Icon(Icons.check, size: 16, color: iconColor),
      ),
    );
  }
}

class _AddSetButton extends StatelessWidget {
  const _AddSetButton({required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add, size: 14, color: AppColors.accent),
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.workoutAddSet()),
          ],
        ),
      ),
    );
  }
}
