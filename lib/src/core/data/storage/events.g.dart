// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventStorageAdapter extends TypeAdapter<EventStorage> {
  @override
  final int typeId = 1;

  @override
  EventStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventStorage(
      id: fields[0] as String,
      slug: fields[2] as String?,
      title: fields[1] as String,
      description: fields[3] as String?,
      startEvent: fields[4] as DateTime,
      finishEvent: fields[5] as DateTime,
      topicId: fields[6] as String,
      imageUrl: fields[8] as String?,
      speakers: (fields[7] as List?)?.cast<SpeakerStorage>(),
    );
  }

  @override
  void write(BinaryWriter writer, EventStorage obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.startEvent)
      ..writeByte(5)
      ..write(obj.finishEvent)
      ..writeByte(6)
      ..write(obj.topicId)
      ..writeByte(7)
      ..write(obj.speakers)
      ..writeByte(8)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TopicStorageAdapter extends TypeAdapter<TopicStorage> {
  @override
  final int typeId = 2;

  @override
  TopicStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TopicStorage(
      id: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TopicStorage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopicStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SpeakerStorageAdapter extends TypeAdapter<SpeakerStorage> {
  @override
  final int typeId = 3;

  @override
  SpeakerStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpeakerStorage(
      id: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SpeakerStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpeakerStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
