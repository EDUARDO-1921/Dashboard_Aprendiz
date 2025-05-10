import 'package:flutter/material.dart';

/// Modelo de datos para cada tarjeta
class CardDataModel {
  final String title;
  final String value;
  final IconData icon;
  const CardDataModel({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class TarjetasDashboard extends StatelessWidget {
  final List<CardDataModel> items;
  const TarjetasDashboard({
    super.key,
    required this.items, // inyección de datos dinámica para las tarjetas
  });

  @override
  Widget build(BuildContext context) {
    // Organiza las tarjetas en filas y columnas, saltando a la siguiente línea cuando no caben, con 16 px de espacio horizontal y vertical
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: items
          .map((item) => CardItem(
                title: item.title,
                value: item.value,
                icon: item.icon,
              ))
          .toList(), // construcción dinámica de CardItem
    );
  }
}

/// Widget que representa una tarjeta de estadística con un icono, un valor y un título
class CardItem extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  // Constructor que inicializa la tarjeta con título, valor e ícono
  const CardItem({super.key, required this.title, required this.value, required this.icon});
  
  // Muestra la tarjeta con icono, valor y título centrados
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
