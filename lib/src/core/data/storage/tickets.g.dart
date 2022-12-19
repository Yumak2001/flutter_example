// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TicketStorageAdapter extends TypeAdapter<TicketStorage> {
  @override
  final int typeId = 4;

  @override
  TicketStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TicketStorage(
      id: fields[0] as String,
      is_free: fields[1] as bool,
      qr_url: fields[2] as String,
      eventId: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TicketStorage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.is_free)
      ..writeByte(2)
      ..write(obj.qr_url)
      ..writeByte(3)
      ..write(obj.eventId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TicketStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
