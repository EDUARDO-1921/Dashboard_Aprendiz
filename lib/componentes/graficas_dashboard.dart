import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GraficaBarras extends StatelessWidget {
  const GraficaBarras({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 6,
          barTouchData: BarTouchData(enabled: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, _) {
                  const dias = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
                  return Text(dias[value.toInt()]);
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: List.generate(7, (i) => _barGroup(i, [2, 3, 1, 4, 5, 2, 0][i])),
        ),
      ),
    );
  }

  BarChartGroupData _barGroup(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          width: 18,
          color: Colors.green,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}

class BarraProgreso extends StatelessWidget {
  const BarraProgreso({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 0.75),
      duration: const Duration(seconds: 2),
      builder: (context, value, _) => LinearProgressIndicator(
        value: value,
        backgroundColor: Colors.grey.shade300,
        color: Colors.green,
      ),
    );
  }
}

class TextoSeccion extends StatelessWidget {
  final String texto;
  const TextoSeccion(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
