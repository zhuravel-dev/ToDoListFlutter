// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toDoModelFiltered.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoModelFilteredAdapter extends TypeAdapter<ToDoModelFiltered> {
  @override
  final int typeId = 2;

  @override
  ToDoModelFiltered read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoModelFiltered(
      id: fields[0] as int,
      text: fields[1] as String,
      isDone: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDoModelFiltered obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModelFilteredAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
