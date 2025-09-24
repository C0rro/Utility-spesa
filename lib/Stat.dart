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
  DateTimeRange? _intervallo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataManager>(
        builder: (context, manager, _) {
          final now = DateTime.now();
          final dataInizio = _intervallo?.start ?? now.subtract(const Duration(days: 30));
          final dataFine = _intervallo?.end ?? now;

          final datiGrafico = manager.calcolaSpesaPerCategoria(dataInizio, dataFine);

          return Column(
            children: [
              const SizedBox(height: 41),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: FilledButton.icon(
                  icon: const Icon(Icons.date_range),
                  label: Text(
                    "${dataInizio.day}/${dataInizio.month}/${dataInizio.year} "
                        " - ${dataFine.day}/${dataFine.month}/${dataFine.year}",
                  ),
                  onPressed: () async {
                    final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: now,
                      initialDateRange: _intervallo ??
                          DateTimeRange(
                            start: now.subtract(const Duration(days: 30)),
                            end: now,
                          ),
                    );

                    if (picked != null) {
                      setState(() {
                        _intervallo = picked;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(height: 30),
              Expanded(child: GraficoStatPage(datiGrafico: datiGrafico)),
            ],
          );
        },
      ),
    );
  }
}


