import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utility_spesa/GraficoStatPage.dart';
import 'dataManager.dart';

class Stat extends StatefulWidget {
  const Stat({super.key});

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  Duration _intervallo = const Duration(days: 30); // Default: 1 mese

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Consumer<DataManager>(
        builder: (context, manager, _) {
          final now = DateTime.now();
          final dataInizio = now.subtract(_intervallo);
          final datiGrafico = manager.calcolaSpesaPerCategoria(dataInizio, now);

          return Column(
            children: [
              const SizedBox(height: 36),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _intervallo = const Duration(days: 7);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _intervallo.inDays == 7
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        foregroundColor: _intervallo.inDays == 7
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      child: const Column(children: [Text("1"), Text("Settimana")]),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _intervallo = const Duration(days: 30);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _intervallo.inDays == 30
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        foregroundColor: _intervallo.inDays == 30
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      child: const Column(children: [Text("1"), Text("Mese")]),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _intervallo = const Duration(days: 120);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _intervallo.inDays == 120
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        foregroundColor: _intervallo.inDays == 120
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      child: const Column(children: [Text("6"), Text("Mesi")]),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _intervallo = const Duration(days: 365);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _intervallo.inDays == 365
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.surface,
                        foregroundColor: _intervallo.inDays == 365
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                      child: const Column(children: [Text("1"), Text("Anno")]),
                    ),
                  ],
                )

              ),

              const SizedBox(height: 16),
              Expanded(child: GraficoStatPage(datiGrafico: datiGrafico)),
            ],
          );
        },
      ),
    );
  }
}
