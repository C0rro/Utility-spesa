import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/posizioni.dart';
import 'AggiungiScansionePage.dart';
import 'dataManager.dart';
import 'alimento.dart';

class FrigoPage extends StatelessWidget {
  const FrigoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Il tuo Frigo')),
      body: Consumer<DataManager>(
        builder: (context, manager, _) {
          final alimenti = manager.filterByPosizione(posizioni.frigo);

          if (alimenti.isEmpty) {
            return const Center(child: Text("Nessun alimento salvato"));
          }

          return ListView.builder(
            itemCount: alimenti.length,
            itemBuilder: (context, index) {
              final alimento = alimenti[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (alimento.dataDiScadenza.isBefore(DateTime.now()))
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(6),
                        child: const Text(
                          "SCADUTO",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ListTile(
                      title: Text(alimento.nome),
                      subtitle: Text(
                        'Marca: ${alimento.marca}\n'
                            'Quantità: ${alimento.quantita}\n'
                            'Costo: €${alimento.costo.toStringAsFixed(2)}\n'
                            'Acquistato il: ${alimento.dataAcquistoToString()}\n'
                            'Scade il: ${alimento.dataScadenzaToString()}',
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Provider.of<DataManager>(
                            context,
                            listen: false,
                          ).deleteAlimento(index);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => AggiungiScansionePage(alimento: alimento),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
