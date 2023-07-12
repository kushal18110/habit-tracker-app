// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class habitModelAdapter extends TypeAdapter<habitModel> {
  @override
  final int typeId = 0;

  @override
  habitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return habitModel(
      habitName: fields[0] as String,
      timeSpent: fields[1] as int,
      goalTime: fields[2] as int,
      habitStarted: fields[3] as bool,
      storedDay: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, habitModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.habitName)
      ..writeByte(1)
      ..write(obj.timeSpent)
      ..writeByte(2)
      ..write(obj.goalTime)
      ..writeByte(3)
      ..write(obj.habitStarted)
      ..writeByte(4)
      ..write(obj.storedDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is habitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
