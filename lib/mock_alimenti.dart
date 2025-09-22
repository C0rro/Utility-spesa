import 'package:utility_spesa/alimento.dart';
import 'package:utility_spesa/categorie.dart';
import 'package:utility_spesa/posizioni.dart';

final List<Alimento> mockAlimenti = [
  // --- SCADUTI - FRIGO ---
  Alimento("Mele", "Melinda", 4, 2.80, DateTime(2025, 8, 10), DateTime(2025, 8, 22), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Yogurt Bianco", "Müller", 4, 3.60, DateTime(2025, 8, 15), DateTime(2025, 8, 23), categorie.latteDerivati, posizioni.frigo),

  // --- SCADUTI - FREEZER ---
  Alimento("Piselli Surgelati", "Orogel", 1, 2.50, DateTime(2025, 7, 1), DateTime(2025, 8, 22), categorie.surgelati, posizioni.freezer),
  Alimento("Filetti di Merluzzo", "Findus", 1, 6.50, DateTime(2025, 6, 28), DateTime(2025, 8, 23), categorie.pesce, posizioni.freezer),

  // --- SCADUTI - SCAFFALI ---
  Alimento("Pane Integrale", "Mulino Bianco", 1, 1.90, DateTime(2025, 8, 18), DateTime(2025, 8, 22), categorie.panificati, posizioni.scaffali),
  Alimento("Biscotti al Cioccolato", "Pavesi", 2, 4.00, DateTime(2025, 8, 12), DateTime(2025, 8, 23), categorie.dolci, posizioni.scaffali),

  // --- ALTRI PRODOTTI ANCORA VALIDI ---
  Alimento("Acqua Naturale", "Sant’Anna", 6, 3.00, DateTime(2025, 8, 10), DateTime(2025, 9, 10), categorie.bevande, posizioni.scaffali),
  Alimento("Sale Marino", "Esselunga", 1, 0.70, DateTime(2025, 8, 1), DateTime(2026, 1, 1), categorie.spezieIgredienti, posizioni.scaffali),
  Alimento("Petto di Pollo", "AIA", 2, 5.00, DateTime(2025, 8, 20), DateTime(2025, 8, 26), categorie.carne, posizioni.frigo),
  Alimento("Latte Parzialmente Scremato", "Granarolo", 3, 4.20, DateTime(2025, 8, 19), DateTime(2025, 8, 29), categorie.latteDerivati, posizioni.frigo),
  Alimento("Fusilli Integrali", "Barilla", 2, 2.40, DateTime(2025, 8, 14), DateTime(2026, 2, 15), categorie.pastaRisoCereali, posizioni.scaffali),
  Alimento("Cioccolato Fondente", "Lindt", 1, 2.80, DateTime(2025, 8, 11), DateTime(2025, 10, 15), categorie.dolci, posizioni.scaffali),
  Alimento("Tonno in scatola", "Rio Mare", 3, 5.40, DateTime(2025, 8, 9), DateTime(2026, 1, 20), categorie.pesce, posizioni.scaffali),
  Alimento("Insalata Mista", "Bonduelle", 1, 2.20, DateTime(2025, 8, 23), DateTime(2025, 8, 27), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Fettine di Tacchino", "Amadori", 1, 4.80, DateTime(2025, 8, 20), DateTime(2025, 8, 28), categorie.carne, posizioni.frigo),
  Alimento("Coca-Cola Zero", "Coca-Cola", 2, 3.80, DateTime(2025, 8, 15), DateTime(2025, 9, 15), categorie.bevande, posizioni.scaffali),
  Alimento("Croissant", "Bauli", 2, 3.50, DateTime(2025, 8, 13), DateTime(2025, 8, 30), categorie.panificati, posizioni.scaffali),
  Alimento("Zucchero Semolato", "Eridania", 1, 1.20, DateTime(2025, 8, 2), DateTime(2026, 1, 1), categorie.spezieIgredienti, posizioni.scaffali),
  Alimento("Spinaci Surgelati", "Orogel", 2, 3.40, DateTime(2025, 8, 17), DateTime(2026, 3, 30), categorie.surgelati, posizioni.freezer),
  Alimento("Caffè Macinato", "Lavazza", 1, 4.90, DateTime(2025, 8, 8), DateTime(2026, 1, 1), categorie.bevande, posizioni.scaffali),
  Alimento("Farina 00", "Molino Spadoni", 2, 2.00, DateTime(2025, 8, 6), DateTime(2025, 12, 15), categorie.spezieIgredienti, posizioni.scaffali),
  Alimento("Formaggio Grana", "Parmareggio", 1, 6.80, DateTime(2025, 8, 10), DateTime(2025, 11, 30), categorie.latteDerivati, posizioni.frigo),
  Alimento("Pangrattato", "Coop", 1, 1.10, DateTime(2025, 8, 12), DateTime(2025, 12, 20), categorie.panificati, posizioni.scaffali),
];


