// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class categorieAdapter extends TypeAdapter<categorie> {
  @override
  final int typeId = 1;

  @override
  categorie read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return categorie.bevande;
      case 1:
        return categorie.fruttaVerdura;
      case 2:
        return categorie.panificati;
      case 3:
        return categorie.spezieIgredienti;
      case 4:
        return categorie.carne;
      case 5:
        return categorie.pesce;
      case 6:
        return categorie.surgelati;
      case 7:
        return categorie.pastaRisoCereali;
      case 8:
        return categorie.dolci;
      case 9:
        return categorie.latteDerivati;
      default:
        return categorie.bevande;
    }
  }

  @override
  void write(BinaryWriter writer, categorie obj) {
    switch (obj) {
      case categorie.bevande:
        writer.writeByte(0);
        break;
      case categorie.fruttaVerdura:
        writer.writeByte(1);
        break;
      case categorie.panificati:
        writer.writeByte(2);
        break;
      case categorie.spezieIgredienti:
        writer.writeByte(3);
        break;
      case categorie.carne:
        writer.writeByte(4);
        break;
      case categorie.pesce:
        writer.writeByte(5);
        break;
      case categorie.surgelati:
        writer.writeByte(6);
        break;
      case categorie.pastaRisoCereali:
        writer.writeByte(7);
        break;
      case categorie.dolci:
        writer.writeByte(8);
        break;
      case categorie.latteDerivati:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is categorieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
