// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeekModelAdapter extends TypeAdapter<WeekModel> {
  @override
  final int typeId = 1;

  @override
  WeekModel read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeekModel(
      morning: fields[1] as bool,
      afterNoon: fields[2] as bool,
      evening: fields[3] as bool,
      id: fields[0] as String,
      week: fields[4] as String,
      isVisible: fields[5] as bool,
      sort: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, WeekModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.morning)
      ..writeByte(2)
      ..write(obj.afterNoon)
      ..writeByte(3)
      ..write(obj.evening)
      ..writeByte(4)
      ..write(obj.week)
      ..writeByte(5)
      ..write(obj.isVisible)
      ..writeByte(6)
      ..write(obj.sort);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeekModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
