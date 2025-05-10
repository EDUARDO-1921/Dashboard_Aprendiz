import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'componentes/barra_navegacion.dart';
import 'componentes/tarjetas_dashboard.dart';   // contiene CardDataModel y TarjetasDashboard
import 'componentes/grafica_anillo.dart';     
import 'componentes/graficas_dashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generación de la fecha y saludo
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

    // Datos dinámicos para la gráfica de barras (7 días de la semana)
    final List<double> datosSemana = [2.0, 3.0, 1.0, 4.0, 5.0, 2.0, 0.0];

    // Datos dinámicos para la gráfica circular
    // inyección de datos gráficaCircular
    final actividades = <PieSectionDataModel>[
      PieSectionDataModel(value: 35, color: Colors.green,      label: "Cardio",   textColor: Colors.white),
      PieSectionDataModel(value: 35, color: Colors.lightGreen, label: "Fuerza",   textColor: Colors.black),
      PieSectionDataModel(value: 30, color: Colors.grey.shade300, label: "Descanso", textColor: Colors.black),
    ]; 

    // Datos dinámicos para las tarjetas de estadísticas
    // inyección de datos TarjetasDashboard
    final tarjetas = <CardDataModel>[
      CardDataModel(title: "Puntos totales",       value: "1,200",   icon: Icons.star),
      CardDataModel(title: "Desafíos completados", value: "45",      icon: Icons.fitness_center),
      CardDataModel(title: "Promedio diario",      value: "3",       icon: Icons.bar_chart),
      CardDataModel(title: "Nivel actual",         value: "Avanzado", icon: Icons.trending_up),
    ]; 

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
                  // Nombre del usuario
                  Text(
                    'Aprendiz SENA',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  // Correo del usuario
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
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              onTap: () => Navigator.pop(context),
            ),
            const Divider(), // Línea separadora
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar sesión'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraNavegacion(), // se llama a la barra navegación
      // Contenido principal
      body: Padding(
        padding: const EdgeInsets.all(16.0), // EdgeInsets es clase para dar espacio
        child: ListView(
          children: [
            // Imagen de perfil circular
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
            // Bienvenida fija
            const Center(
              child: Text(
                "Bienvenido, Aprendiz",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
            // Fecha actual
            Center(
              child: Text(
                fechaHoy,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 8),
            // Saludo según la hora
            Center(
              child: Text(
                saludo,
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Tarjetas de estadísticas con datos dinámicos
            TarjetasDashboard(items: tarjetas), // pasa diamnicamente la lista 
            const SizedBox(height: 32),
            // Progreso de nivel
            const TextoSeccion("Progreso de Nivel"),
            const BarraProgreso(),
            const SizedBox(height: 32),
            // Progreso semanal de desafíos con datos dinámicos
            const TextoSeccion("Progreso semanal de desafíos"),
            const SizedBox(height: 16),
            GraficaBarras(valores: datosSemana), // pasa lista
            const SizedBox(height: 32),
            GraficaCircular(sections: actividades), // inyección de datos gráficaCircular
          ],
        ),
      ),
    );
  }
}
