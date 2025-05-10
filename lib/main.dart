import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // permite usar fuentes de Google
import 'package:intl/date_symbol_data_local.dart'; // configurar la localización (fechas,idioma)
import 'dashboard.dart';
//punto de entrada
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null); //configura el idioma
  runApp(const MyApp());
}
//Define la clase  MyApp,
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard Aprendiz',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), //Define la paleta de colores,
        useMaterial3: true, //Usa el diseño más reciente de 
      ),
      home: const DashboardScreen(), //mostrar el DashboardScreen
      debugShowCheckedModeBanner: false,
    );
  }
}
