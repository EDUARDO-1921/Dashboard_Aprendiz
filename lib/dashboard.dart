import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'componentes/barra_navegacion.dart';
import 'componentes/tarjetas_dashboard.dart';
import 'componentes/grafica_anillo.dart';
import 'componentes/graficas_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fechaHoy = DateFormat('EEEE d MMMM', 'es').format(DateTime.now());
    final hora = DateTime.now().hour;

    String saludo;
    if (hora < 12) {
      saludo = '¡Buenos días!';
    } else if (hora < 18) {
      saludo = '¡Buenas tardes!';
    } else {
      saludo = '¡Buenas noches!';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard del Aprendiz'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/perfil.png'),
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Aprendiz SENA',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    'aprendiz@sena.edu.co',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () {
                // Aquí puedes redirigir al perfil
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login'); // asegúrate de tener esta ruta
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacion(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green, width: 3),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/perfil.png',
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Center(
              child: Text(
                "Bienvenido, Aprendiz",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                fechaHoy,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                saludo,
                style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.green),
              ),
            ),
            const SizedBox(height: 24),
            const TarjetasDashboard(),
            const SizedBox(height: 32),
            const TextoSeccion("Progreso de Nivel"),
            const BarraProgreso(),
            const SizedBox(height: 32),
            const TextoSeccion("Progreso semanal de desafíos"),
            const SizedBox(height: 16),
            const GraficaBarras(),
            const SizedBox(height: 32),
            const GraficaCircular(),
          ],
        ),
      ),
    );
  }
}
