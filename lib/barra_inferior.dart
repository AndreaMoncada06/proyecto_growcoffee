import 'package:flutter/material.dart';
import 'calendario_mensual.dart';
import 'pantalla_principal.dart';
import 'pantalla_reportes.dart';
import 'pantalla_inventario.dart';

class BarraInferior extends StatelessWidget {
  final int selectedIndex;

  const BarraInferior({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color kBrown = Color(0xFF7B3A23);

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CalendarioMensual()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PantallaPrincipal()),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => PantallaReportes()),
          );
        } else if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PantallaInventario()),
          );
        }
      },
      backgroundColor: kBrown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calendario',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Reportes'),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Inventario',
        ),
      ],
    );
  }
}
