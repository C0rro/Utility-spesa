// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posizioni.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class posizioniAdapter extends TypeAdapter<posizioni> {
  @override
  final int typeId = 2;

  @override
  posizioni read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return posizioni.frigo;
      case 1:
        return posizioni.freezer;
      case 2:
        return posizioni.scaffali;
      default:
        return posizioni.frigo;
    }
  }

  @override
  void write(BinaryWriter writer, posizioni obj) {
    switch (obj) {
      case posizioni.frigo:
        writer.writeByte(0);
        break;
      case posizioni.freezer:
        writer.writeByte(1);
        break;
      case posizioni.scaffali:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is posizioniAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
