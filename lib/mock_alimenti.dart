import 'package:utility_spesa/alimento.dart';
import 'package:utility_spesa/categorie.dart';
import 'package:utility_spesa/posizioni.dart';

final List<Alimento> mockAlimenti = [
  // --- ACQUISTI NATALIZI / FINE DICEMBRE (Molti già scaduti o al limite) ---
  Alimento("Cotechino", "Fini", 1, 5.50, DateTime(2025, 12, 20), DateTime(2026, 1, 10), categorie.carne, posizioni.frigo),
  Alimento("Salmone Affumicato", "Labeyrie", 1, 8.90, DateTime(2025, 12, 22), DateTime(2026, 1, 5), categorie.pesce, posizioni.frigo),
  Alimento("Mascarpone", "Galbani", 1, 3.20, DateTime(2025, 12, 18), DateTime(2026, 1, 12), categorie.latteDerivati, posizioni.frigo),
  Alimento("Pandoro", "Bauli", 1, 6.00, DateTime(2025, 12, 15), DateTime(2026, 1, 30), categorie.dolci, posizioni.scaffali),
  Alimento("Panettone", "Maina", 1, 5.50, DateTime(2025, 12, 17), DateTime(2026, 1, 25), categorie.dolci, posizioni.scaffali),
  Alimento("Uva Bianca", "Generico", 1, 2.50, DateTime(2025, 12, 28), DateTime(2026, 1, 4), categorie.fruttaVerdura, posizioni.frigo),

  // --- ACQUISTI GENNAIO (In scadenza o validi) ---
  Alimento("Latte Fresco", "Granarolo", 2, 3.20, DateTime(2026, 1, 10), DateTime(2026, 1, 18), categorie.latteDerivati, posizioni.frigo),
  Alimento("Ricotta", "Vallelata", 1, 1.90, DateTime(2026, 1, 12), DateTime(2026, 1, 19), categorie.latteDerivati, posizioni.frigo),
  Alimento("Petto di Pollo", "AIA", 2, 5.40, DateTime(2026, 1, 14), DateTime(2026, 1, 20), categorie.carne, posizioni.frigo),
  Alimento("Hamburger", "Amadori", 4, 6.00, DateTime(2026, 1, 15), DateTime(2026, 1, 22), categorie.carne, posizioni.frigo),
  Alimento("Spinaci Novelli", "Bonduelle", 1, 2.10, DateTime(2026, 1, 16), DateTime(2026, 1, 21), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Bresaola", "Rigamonti", 1, 4.50, DateTime(2026, 1, 5), DateTime(2026, 1, 25), categorie.carne, posizioni.frigo),
  Alimento("Yogurt Greco", "Fage", 3, 4.50, DateTime(2026, 1, 2), DateTime(2026, 1, 28), categorie.latteDerivati, posizioni.frigo),

  // --- ACQUISTI RECENTISSIMI (Scadenza Febbraio) ---
  Alimento("Uova", "Aia", 6, 2.80, DateTime(2026, 1, 15), DateTime(2026, 2, 5), categorie.latteDerivati, posizioni.frigo),
  Alimento("Burro", "Prealpi", 1, 2.50, DateTime(2026, 1, 10), DateTime(2026, 2, 15), categorie.latteDerivati, posizioni.frigo),
  Alimento("Hummus", "Noa", 1, 2.00, DateTime(2026, 1, 16), DateTime(2026, 2, 2), categorie.fruttaVerdura, posizioni.frigo),
  Alimento("Stracchino", "Nonno Nanni", 1, 2.30, DateTime(2026, 1, 17), DateTime(2026, 2, 1), categorie.latteDerivati, posizioni.frigo),

  // --- DISPENSA E SURGELATI (Comprati tra Dicembre e Gennaio) ---
  Alimento("Pasta Mezze Maniche", "Molisana", 2, 2.80, DateTime(2025, 12, 20), DateTime(2027, 6, 30), categorie.pastaRisoCereali, posizioni.scaffali),
  Alimento("Tonno", "Nostromo", 3, 4.50, DateTime(2026, 1, 5), DateTime(2028, 1, 5), categorie.pesce, posizioni.scaffali),
  Alimento("Biscotti Tarallucci", "Mulino Bianco", 1, 3.00, DateTime(2026, 1, 12), DateTime(2026, 9, 30), categorie.dolci, posizioni.scaffali),
  Alimento("Pizza Margherita", "Italpizza", 2, 5.00, DateTime(2026, 1, 2), DateTime(2026, 12, 30), categorie.surgelati, posizioni.freezer),
  Alimento("Bastoncini", "Findus", 1, 4.80, DateTime(2025, 12, 27), DateTime(2026, 11, 15), categorie.surgelati, posizioni.freezer),
  Alimento("Minestrone", "Orogel", 1, 3.20, DateTime(2026, 1, 10), DateTime(2027, 1, 10), categorie.surgelati, posizioni.freezer),
  Alimento("Succo d'Arancia", "Santàl", 3, 4.50, DateTime(2026, 1, 8), DateTime(2026, 2, 20), categorie.bevande, posizioni.scaffali),
];