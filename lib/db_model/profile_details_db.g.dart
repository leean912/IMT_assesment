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
      fields[0] as ProfileDetails,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileDetailsDb obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.profileDetails);
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
