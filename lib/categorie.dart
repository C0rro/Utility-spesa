import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'categorie.g.dart';

@HiveType(typeId: 1)
enum categorie {
  @HiveField(0)
  bevande,

  @HiveField(1)
  fruttaVerdura,

  @HiveField(2)
  panificati,

  @HiveField(3)
  spezieIgredienti,

  @HiveField(4)
  carne,

  @HiveField(5)
  pesce,

  @HiveField(6)
  surgelati,

  @HiveField(7)
  pastaRisoCereali,

  @HiveField(8)
  dolci,

  @HiveField(9)
  latteDerivati
}

extension categorieExtension on categorie {
  String get nome {
    switch (this) {
      case categorie.bevande:
        return 'Bevande';
      case categorie.fruttaVerdura:
        return 'Frutta e Verdura';
      case categorie.panificati:
        return 'Panificati';
      case categorie.spezieIgredienti:
        return 'Spezie e Ingredienti';
      case categorie.carne:
        return 'Carne';
      case categorie.pesce:
        return 'Pesce';
      case categorie.surgelati:
        return 'Surgelati';
      case categorie.pastaRisoCereali:
        return 'Pasta, Riso e Cereali';
      case categorie.dolci:
        return 'Dolci';
      case categorie.latteDerivati:
        return 'Latte e Derivati';
    }
  }
  Color get colore {
    switch (this) {
      case categorie.bevande:
        return Colors.blue.shade500;
      case categorie.fruttaVerdura:
        return Colors.green.shade500;
      case categorie.panificati:
        return Colors.red.shade500;
      case categorie.spezieIgredienti:
        return Colors.orange.shade500;
      case categorie.carne:
        return Colors.brown.shade500;
      case categorie.pesce:
        return Colors.cyan.shade500;
      case categorie.surgelati:
        return Colors.indigo.shade500;
      case categorie.pastaRisoCereali:
        return Colors.yellow.shade500;
      case categorie.dolci:
        return Colors.pink.shade500;
      case categorie.latteDerivati:
        return Colors.purple.shade500;
    }
  }
}


