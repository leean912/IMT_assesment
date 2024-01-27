// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileDetailsDbAdapter extends TypeAdapter<ProfileDetailsDb> {
  @override
  final int typeId = 0;

  @override
  ProfileDetailsDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileDetailsDb(
      name: fields[0] as String,
      email: fields[1] as String,
      profileUrl: fields[2] as String,
      state: fields[3] as String,
      country: fields[4] as String,
      national: fields[5] as String,
      uuid: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDetailsDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.profileUrl)
      ..writeByte(3)
      ..write(obj.state)
      ..writeByte(4)
      ..write(obj.country)
      ..writeByte(5)
      ..write(obj.national)
      ..writeByte(6)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDetailsDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
