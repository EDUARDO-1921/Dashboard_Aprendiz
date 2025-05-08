import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficaCircular extends StatelessWidget {
  const GraficaCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Distribución de Actividades",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Center(
          child: SizedBox(
            height: 260,
            width: 260,
            child: PieChart(
              PieChartData(
                startDegreeOffset: -90,
                sectionsSpace: 3,
                centerSpaceRadius: 70,
                sections: [
                  _section(35, Colors.green, "Cardio", Colors.white),
                  _section(35, Colors.lightGreen, "Fuerza", Colors.black),
                  _section(30, Colors.grey.shade300, "Descanso", Colors.black),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  PieChartSectionData _section(double value, Color color, String label, Color textColor) {
    return PieChartSectionData(
      value: value,
      color: color,
      radius: 70,
      title: label,
      titleStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: textColor),
      titlePositionPercentageOffset: 0.65,
    );
  }
}
