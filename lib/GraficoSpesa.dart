import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficoSpesa extends StatelessWidget {
  final double budget;
  final double spesi;

  const GraficoSpesa({
    super.key,
    required this.spesi,
    required this.budget,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOverBudget = spesi > budget;
    final double nonSpesi = (budget - spesi).clamp(0, budget).toDouble();

    final Color spesiColor = isOverBudget
        ? Colors.red
        : Theme.of(context).colorScheme.primary;

    final double percentuale = ((spesi / budget) * 100).clamp(0, 999);

    return Column(
          children: [
            // Dettagli budget e spesa
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Budget'),
                    Text(
                      '${budget.toStringAsFixed(2)} €',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text('Spesi'),
                    Text(
                      '${spesi.toStringAsFixed(2)} €',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isOverBudget ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: spesi > budget ? budget : spesi,
                      color: spesiColor,
                      title: '${percentuale.toStringAsFixed(1)}%',
                      titleStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      radius: 60,
                    ),
                    if (!isOverBudget)
                      PieChartSectionData(
                        value: nonSpesi,
                        color: Colors.grey[300],
                        title: '',
                        radius: 60,
                      ),
                  ],
                  sectionsSpace: 2,
                  centerSpaceRadius: 40,
                ),
              ),
            ),
          ],
    );
  }
}


