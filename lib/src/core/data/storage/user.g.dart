// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InterestProfileStorageAdapter
    extends TypeAdapter<InterestProfileStorage> {
  @override
  final int typeId = 0;

  @override
  InterestProfileStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InterestProfileStorage(
      music: fields[0] as bool,
      comics: fields[1] as bool,
      painting: fields[2] as bool,
      games: fields[3] as bool,
      books: fields[4] as bool,
      technologies: fields[5] as bool,
      newKnowledge: fields[6] as bool,
      cityEvents: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, InterestProfileStorage obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.music)
      ..writeByte(1)
      ..write(obj.comics)
      ..writeByte(2)
      ..write(obj.painting)
      ..writeByte(3)
      ..write(obj.games)
      ..writeByte(4)
      ..write(obj.books)
      ..writeByte(5)
      ..write(obj.technologies)
      ..writeByte(6)
      ..write(obj.newKnowledge)
      ..writeByte(7)
      ..write(obj.cityEvents);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterestProfileStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserStorageAdapter extends TypeAdapter<UserStorage> {
  @override
  final int typeId = 5;

  @override
  UserStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStorage(
      firstName: fields[0] as String,
      surName: fields[1] as String,
      email: fields[2] as String,
      city: fields[3] as String?,
      age: fields[4] as String?,
      imageUrl: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserStorage obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.surName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.age)
      ..writeByte(5)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
