import 'package:flutter_bloc/flutter_bloc.dart';

/// Shared state for a workout session, coordinating the sets table and the
/// footer's rest timer.
abstract class WorkoutSessionState {}

/// Nothing has happened yet this session.
class WorkoutSessionInitial extends WorkoutSessionState {}

/// A set was just completed or undone — the footer re-reads the completed-set
/// count and re-evaluates its timer gate.
class WorkoutProgressChanged extends WorkoutSessionState {}

/// The rest timer is counting down — the sets table absorbs all gestures so no
/// set can be logged until the rest finishes.
class WorkoutTimerRunning extends WorkoutSessionState {}

/// The rest timer has finished — the sets table becomes interactive again.
class WorkoutTimerStopped extends WorkoutSessionState {}

/// Lets [WorkoutSetsTable] and [WorkoutFooterBar] react to one another:
/// the table reports set-completion progress (rebuilding the footer's gate),
/// and the footer reports when the rest timer runs (so the table locks).
class WorkoutSessionCubit extends Cubit<WorkoutSessionState> {
  WorkoutSessionCubit() : super(WorkoutSessionInitial());

  /// Call after a set is completed or undone.
  void notifyProgressChanged() => emit(WorkoutProgressChanged());

  /// Call when the rest timer starts counting down.
  void timerStarted() => emit(WorkoutTimerRunning());

  /// Call when the rest timer finishes — the table becomes interactive again.
  void timerStopped() => emit(WorkoutTimerStopped());
}
