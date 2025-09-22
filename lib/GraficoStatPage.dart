import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'categorie.dart';


class GraficoStatPage extends StatelessWidget {
  final Map<categorie, double> datiGrafico;

  const GraficoStatPage({super.key, required this.datiGrafico});

  @override
  Widget build(BuildContext context) {
    if (datiGrafico.isEmpty || datiGrafico.values.every((v) => v == 0)) {
      return Center(
        child: Text(
          "Nessun dato disponibile per il periodo selezionato.",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }
    final totale = datiGrafico.values.fold(0.0, (a, b) => a + b);

    final entries = datiGrafico.entries.toList()..sort((a,b) => b.value.compareTo(a.value));

    return Center(
      child: Column(
        children: [
          Expanded(
            child: PieChart(
              PieChartData(
                sections: List.generate(entries.length, (i) {
                  final e = entries[i];
                  final categoria = e.key;
                  final percentuale = (e.value / totale * 100);
                  return PieChartSectionData(
                    color: categoria.colore,
                    value: e.value,
                    title: "${percentuale.toStringAsFixed(1)}%",
                    radius: 80,
                    titleStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                }),
                sectionsSpace: 2,
                centerSpaceRadius: 50,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: entries.length,
              itemBuilder: (context, i) {
                final categoria = entries[i].key;
                final valore = entries[i].value;
                return ListTile(
                  leading: CircleAvatar(backgroundColor: categoria.colore),
                  title: Text(categoria.nome),
                  trailing: Text("€${valore.toStringAsFixed(2)}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
