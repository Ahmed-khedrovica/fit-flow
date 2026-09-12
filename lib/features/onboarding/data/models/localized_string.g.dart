// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localized_string.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalizedStringAdapter extends TypeAdapter<LocalizedString> {
  @override
  final int typeId = 1;

  @override
  LocalizedString read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalizedString(
      en: fields[0] as String,
      ar: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LocalizedString obj) {
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
      other is LocalizedStringAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
