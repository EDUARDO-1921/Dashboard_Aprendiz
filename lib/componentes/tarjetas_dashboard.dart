import 'package:flutter/material.dart';

class TarjetasDashboard extends StatelessWidget {
  const TarjetasDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: const [
        CardItem(title: "Puntos totales", value: "1,200", icon: Icons.star),
        CardItem(title: "Desafíos completados", value: "45", icon: Icons.fitness_center),
        CardItem(title: "Promedio diario", value: "3", icon: Icons.bar_chart),
        CardItem(title: "Nivel actual", value: "Avanzado", icon: Icons.trending_up),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const CardItem({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 100,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28, color: Colors.green),
              const SizedBox(height: 6),
              Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
