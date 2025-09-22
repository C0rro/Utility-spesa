import 'package:flutter/material.dart';

class ImpostazioniManager extends ChangeNotifier {
  double _budgetMensile = 150.0;
  int _giorniAvvisoScadenza = 3;

  double get budgetMensile => _budgetMensile;
  int get giorniAvvisoScadenza => _giorniAvvisoScadenza;

  void setBudgetMensile(double nuovoBudget) {
    _budgetMensile = nuovoBudget;
    notifyListeners();
  }

  void setGiorniAvvisoScadenza(int giorni) {
    _giorniAvvisoScadenza = giorni;
    notifyListeners();
  }
}
