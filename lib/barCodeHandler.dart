import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> getProductData(String barcode) async {
  final url = Uri.parse("https://world.openfoodfacts.org/api/v0/product/$barcode.json");

  for (int attempt = 0; attempt < 5; attempt++) {
    try {
      final response = await http.get(url).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 1) {
          return data['product'];
        } else {
          return null; // Prodotto non trovato
        }
      }
    }
    catch (_) {
      // Qualsiasi errore: retry
    }

    await Future.delayed(const Duration(milliseconds: 500));
  }

  return null;
}



Future<String> getNomeAlimento(String? codice) async {
  final prodotto = await getProductData(codice!);

  return  prodotto?['product_name'] ?? 'Nome non trovato';
  }

Future<String>  getMarcaAlimento(String? codice) async {
  final prodotto = await getProductData(codice!);

  return prodotto?['brands'] ?? 'Marca non trovata';

}
