// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_day_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutDayModelAdapter extends TypeAdapter<WorkoutDayModel> {
  @override
  final int typeId = 5;

  @override
  WorkoutDayModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutDayModel(
      dayNumber: fields[0] as int,
      workoutTitle: fields[1] as LocalizedString,
      workoutExercises: (fields[2] as List).cast<WorkoutExerciseModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutDayModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dayNumber)
      ..writeByte(1)
      ..write(obj.workoutTitle)
      ..writeByte(2)
      ..write(obj.workoutExercises);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutDayModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
