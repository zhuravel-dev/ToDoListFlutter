// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passcodeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasscodeModelAdapter extends TypeAdapter<PasscodeModel> {
  @override
  final int typeId = 1;

  @override
  PasscodeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasscodeModel(
      passcode: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PasscodeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.passcode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PasscodeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
