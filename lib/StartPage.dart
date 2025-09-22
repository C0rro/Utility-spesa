import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/AggiungiAlimentoPage.dart';
import 'package:utility_spesa/GraficoSpesa.dart';
import 'package:utility_spesa/ScannerizzaBarCode.dart';
import 'dataManager.dart';
import 'ImpostazioniManager.dart';
import 'Impostazioni.dart';

class Startpage extends StatefulWidget {
  const Startpage({super.key});

  @override
  State<Startpage> createState() => _StartpageState();
}

class _StartpageState extends State<Startpage> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/images/Logo.png', height: 80),
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: "Impostazioni",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => Impostazioni()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (_isMenuOpen)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: FloatingActionButton.extended(
                heroTag: 'btn1',
                icon: Icon(Icons.create),
                label: Text('Scrivi'),
                onPressed: () {
                  setState(() => _isMenuOpen = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AggiungiAlimentoPage()),
                  );
                },
              ),
            ),
          if (_isMenuOpen)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: FloatingActionButton.extended(
                heroTag: 'btn2',
                icon: Icon(Icons.document_scanner),
                label: Text('Scansiona'),
                onPressed: () {
                  setState(() => _isMenuOpen = false);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ScannerizzaBarCode()),
                  );
                },
              ),
            ),
          FloatingActionButton(
            heroTag: 'main',
            onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
            child: Icon(_isMenuOpen ? Icons.close : Icons.menu),
          ),
        ],
      ),
      body: Consumer2<DataManager, ImpostazioniManager>(
        builder: (context, data, settings, _) {
          final datiGrafico = data.generaDatiPerGrafico(
            DateTime(DateTime.now().year, DateTime.now().month, 1),
            DateTime.now(),
          );

          final alimentiInScadenza = data.filterByDateScadenza(
            DateTime.now(),
            DateTime.now().add(Duration(days: settings.giorniAvvisoScadenza)),
          );

          final giorniAvvisoScadenza = settings.giorniAvvisoScadenza.toString();

          return Column(
            children: [
              Card(
                elevation: 4,
                margin: EdgeInsets.all(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        'Questo mese',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      GraficoSpesa(spesi: datiGrafico, budget: settings.budgetMensile),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(
                  "Alimenti in scadenza nei prossimi " + giorniAvvisoScadenza + " giorni:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: alimentiInScadenza.isEmpty
                    ? Center(child: Text("Nessun alimento in scadenza"))
                    : ScrollConfiguration(
                  behavior: ScrollBehavior().copyWith(overscroll: false),
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: alimentiInScadenza.length,
                    itemBuilder: (context, index) {
                      final alimento = alimentiInScadenza[index];
                      return Card(
                        margin: EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(alimento.nome),
                          subtitle: Text(
                            'Marca: ${alimento.marca}\n'
                                'Quantità: ${alimento.quantita}\n'
                                'Scade il: ${alimento.dataScadenzaToString()}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
