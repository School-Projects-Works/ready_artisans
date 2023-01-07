// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Users.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UsersAdapter extends TypeAdapter<Users> {
  @override
  final int typeId = 0;

  @override
  Users read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Users(
      id: fields[0] as String?,
      name: fields[1] as String?,
      email: fields[2] as String?,
      phone: fields[3] as String?,
      idCard: fields[4] as String?,
      profile: fields[5] as String?,
      role: fields[6] as String?,
      status: fields[7] as String?,
      createdAt: fields[8] as int?,
      address: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Users obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.idCard)
      ..writeByte(5)
      ..write(obj.profile)
      ..writeByte(6)
      ..write(obj.role)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.createdAt)
      ..writeByte(9)
      ..write(obj.address);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
