import 'package:utility_spesa/alimento.dart';
import 'package:utility_spesa/categorie.dart';
import 'package:utility_spesa/posizioni.dart';

final List<Alimento> mockAlimenti = [
  // --- SCADUTI - FRIGO ---
  Alimento("Mele", "Melinda", 4, 2.80, DateTime(2025, 9, 1), DateTime(2025, 9, 15), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Yogurt Bianco", "Müller", 4, 3.60, DateTime(2025, 9, 5), DateTime(2025, 9, 20), categorie.latteDerivati, posizioni.frigo),

  // --- SCADUTI - FREEZER ---
  Alimento("Piselli Surgelati", "Orogel", 1, 2.50, DateTime(2025, 6, 1), DateTime(2025, 9, 10), categorie.surgelati, posizioni.freezer),
  Alimento("Filetti di Merluzzo", "Findus", 1, 6.50, DateTime(2025, 7, 10), DateTime(2025, 9, 18), categorie.pesce, posizioni.freezer),

  // --- SCADUTI - SCAFFALI ---
  Alimento("Pane Integrale", "Mulino Bianco", 1, 1.90, DateTime(2025, 9, 10), DateTime(2025, 9, 20), categorie.panificati, posizioni.scaffali),
  Alimento("Biscotti al Cioccolato", "Pavesi", 2, 4.00, DateTime(2025, 9, 5), DateTime(2025, 9, 19), categorie.dolci, posizioni.scaffali),

  // --- IN SCADENZA ---
  Alimento("Petto di Pollo", "AIA", 2, 5.00, DateTime(2025, 9, 22), DateTime(2025, 9, 25), categorie.carne, posizioni.frigo),
  Alimento("Insalata Mista", "Bonduelle", 1, 2.20, DateTime(2025, 9, 23), DateTime(2025, 9, 26), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Latte Parzialmente Scremato", "Granarolo", 3, 4.20, DateTime(2025, 9, 22), DateTime(2025, 9, 28), categorie.latteDerivati, posizioni.frigo),
  Alimento("Fettine di Tacchino", "Amadori", 1, 4.80, DateTime(2025, 9, 21), DateTime(2025, 9, 27), categorie.carne, posizioni.frigo),
  Alimento("Croissant", "Bauli", 2, 3.50, DateTime(2025, 9, 15), DateTime(2025, 9, 29), categorie.panificati, posizioni.scaffali),

  // --- VALIDI A MEDIA SCADENZA ---
  Alimento("Coca-Cola Zero", "Coca-Cola", 2, 3.80, DateTime(2025, 9, 10), DateTime(2025, 10, 20), categorie.bevande, posizioni.scaffali),
  Alimento("Cioccolato Fondente", "Lindt", 1, 2.80, DateTime(2025, 9, 11), DateTime(2025, 11, 15), categorie.dolci, posizioni.scaffali),
  Alimento("Formaggio Grana", "Parmareggio", 1, 6.80, DateTime(2025, 9, 5), DateTime(2025, 12, 1), categorie.latteDerivati, posizioni.frigo),
  Alimento("Farina 00", "Molino Spadoni", 2, 2.00, DateTime(2025, 9, 6), DateTime(2025, 12, 15), categorie.spezieIgredienti, posizioni.scaffali),
  Alimento("Pangrattato", "Coop", 1, 1.10, DateTime(2025, 9, 12), DateTime(2025, 12, 20), categorie.panificati, posizioni.scaffali),

  // --- VALIDI A LUNGA SCADENZA ---
  Alimento("Acqua Naturale", "Sant’Anna", 6, 3.00, DateTime(2025, 9, 1), DateTime(2025, 12, 30), categorie.bevande, posizioni.scaffali),
  Alimento("Sale Marino", "Esselunga", 1, 0.70, DateTime(2025, 8, 1), DateTime(2026, 1, 1), categorie.spezieIgredienti, posizioni.scaffali),
  Alimento("Fusilli Integrali", "Barilla", 2, 2.40, DateTime(2025, 9, 14), DateTime(2026, 2, 15), categorie.pastaRisoCereali, posizioni.scaffali),
  Alimento("Tonno in scatola", "Rio Mare", 3, 5.40, DateTime(2025, 9, 9), DateTime(2026, 1, 20), categorie.pesce, posizioni.scaffali),
  Alimento("Spinaci Surgelati", "Orogel", 2, 3.40, DateTime(2025, 9, 17), DateTime(2026, 3, 30), categorie.surgelati, posizioni.freezer),
  Alimento("Caffè Macinato", "Lavazza", 1, 4.90, DateTime(2025, 9, 8), DateTime(2026, 1, 1), categorie.bevande, posizioni.scaffali),
  Alimento("Zucchero Semolato", "Eridania", 1, 1.20, DateTime(2025, 9, 2), DateTime(2026, 1, 1), categorie.spezieIgredienti, posizioni.scaffali),
];


