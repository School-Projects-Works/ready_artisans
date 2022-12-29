// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServicesProvider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServicesProviderAdapter extends TypeAdapter<ServicesProvider> {
  @override
  final int typeId = 1;

  @override
  ServicesProvider read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServicesProvider(
      id: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      image: fields[3] as String?,
      status: fields[4] as String?,
      createdAt: fields[5] as int?,
      creatorId: fields[6] as String?,
      creatorName: fields[7] as String?,
      creatorEmail: fields[8] as String?,
      creatorPhone: fields[9] as String?,
      creatorIdCard: fields[10] as String?,
      creatorProfile: fields[11] as String?,
      contact: (fields[12] as Map?)?.cast<String, dynamic>(),
      services: (fields[13] as List?)?.cast<String>(),
      images: (fields[14] as List?)?.cast<String>(),
      videos: (fields[15] as List?)?.cast<String>(),
      certificates: (fields[16] as List?)?.cast<String>(),
      rating: fields[17] as double?,
      reviews: (fields[18] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      lat: fields[19] as double?,
      lng: fields[20] as double?,
      location: (fields[21] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, ServicesProvider obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.creatorId)
      ..writeByte(7)
      ..write(obj.creatorName)
      ..writeByte(8)
      ..write(obj.creatorEmail)
      ..writeByte(9)
      ..write(obj.creatorPhone)
      ..writeByte(10)
      ..write(obj.creatorIdCard)
      ..writeByte(11)
      ..write(obj.creatorProfile)
      ..writeByte(12)
      ..write(obj.contact)
      ..writeByte(13)
      ..write(obj.services)
      ..writeByte(14)
      ..write(obj.images)
      ..writeByte(15)
      ..write(obj.videos)
      ..writeByte(16)
      ..write(obj.certificates)
      ..writeByte(17)
      ..write(obj.rating)
      ..writeByte(18)
      ..write(obj.reviews)
      ..writeByte(19)
      ..write(obj.lat)
      ..writeByte(20)
      ..write(obj.lng)
      ..writeByte(21)
      ..write(obj.location);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServicesProviderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
