// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizedListAdapter extends TypeAdapter<LocalizedList> {
  @override
  final int typeId = 2;

  @override
  LocalizedList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizedList(
      en: (fields[0] as List).cast<String>(),
      ar: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, LocalizedList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.en)
      ..writeByte(1)
      ..write(obj.ar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalizedListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
