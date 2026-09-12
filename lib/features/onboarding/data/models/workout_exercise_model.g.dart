// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutExerciseModelAdapter extends TypeAdapter<WorkoutExerciseModel> {
  @override
  final int typeId = 4;

  @override
  WorkoutExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutExerciseModel(
      exerciseId: fields[0] as String,
      sets: fields[1] as int,
      reps: fields[2] as String,
      restSeconds: fields[3] as int,
      exercise: fields[4] as ExerciseModel?,
      startingWeight: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutExerciseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.exerciseId)
      ..writeByte(1)
      ..write(obj.sets)
      ..writeByte(2)
      ..write(obj.reps)
      ..writeByte(3)
      ..write(obj.restSeconds)
      ..writeByte(4)
      ..write(obj.exercise)
      ..writeByte(5)
      ..write(obj.startingWeight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
