import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:utility_spesa/posizioni.dart';
import 'alimento.dart';
import 'categorie.dart';

class DataManager extends ChangeNotifier {
  late Box<Alimento> _box;
  List<Alimento> _alimenti = [];

  List<Alimento> get alimenti => _alimenti;

  Future<void> init() async {
    _box = await Hive.openBox<Alimento>('alimenti');
    _alimenti = _box.values.toList();
    notifyListeners();
  }

  void addAlimento(Alimento alimento) {
    _box.add(alimento);
    _alimenti = _box.values.toList();
    notifyListeners();
  }


  void deleteAlimento(int index) {
    final key = _box.keyAt(index);
    _box.delete(key);
    _alimenti = _box.values.toList();
    notifyListeners();
  }

  void modificaAlimento(Alimento a) {
    a.save();
    notifyListeners();
  }

  List<Alimento> filterByDateAcquisto(DateTime from, DateTime to) {
    return _alimenti.where((a) =>
    a.dataDiAcquisto.isAfter(from) &&
        a.dataDiAcquisto.isBefore(to)
    ).toList();
  }

  List<Alimento> filterByDateScadenza(DateTime from, DateTime to) {
    return _alimenti.where((a) =>
    a.dataDiScadenza.isAfter(from) &&
        a.dataDiScadenza.isBefore(to)
    ).toList();
  }

  double generaDatiPerGrafico(DateTime inizio, DateTime fine) {
    double spesa = 0;
    List<Alimento> filtrati = filterByDateAcquisto(inizio, fine);

    for(int x = 0; x < filtrati.length; x++){
      spesa = spesa + filtrati[x].costo;
    }

    return spesa;
  }

  Map<categorie, double> calcolaSpesaPerCategoria(DateTime inizio, DateTime fine) {
    List<Alimento> alimentiFiltrati = filterByDateAcquisto(inizio, fine);
    final mappa = <categorie, double>{};
    for (var alimento in alimentiFiltrati) {
      final cat = alimento.categoria;
      mappa[cat] = (mappa[cat] ?? 0) + alimento.costo;
    }
    return mappa;
  }

  List<Alimento> filterByPosizione(posizioni posizione) {
    return _alimenti.where((a) =>
    a.posizione == posizione
    ).toList();
  }


}
