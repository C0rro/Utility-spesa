// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alimento.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlimentoAdapter extends TypeAdapter<Alimento> {
  @override
  final int typeId = 0;

  @override
  Alimento read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Alimento(
      fields[0] as String,
      fields[1] as String,
      fields[2] as int,
      fields[3] as double,
      fields[4] as DateTime,
      fields[5] as DateTime,
      fields[6] as categorie,
      fields[7] as posizioni,
    );
  }

  @override
  void write(BinaryWriter writer, Alimento obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.nome)
      ..writeByte(1)
      ..write(obj.marca)
      ..writeByte(2)
      ..write(obj.quantita)
      ..writeByte(3)
      ..write(obj.costo)
      ..writeByte(4)
      ..write(obj.dataDiAcquisto)
      ..writeByte(5)
      ..write(obj.dataDiScadenza)
      ..writeByte(6)
      ..write(obj.categoria)
      ..writeByte(7)
      ..write(obj.posizione);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlimentoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
