import 'package:flutter/material.dart';
import 'barra_inferior.dart';
import 'barra_superior_calendario.dart';

const Color kBackground = Color(0xFFFCF5D8);
const Color kBrown = Color(0xFF6B3E2E);

class CalendarioDiario extends StatefulWidget {
  const CalendarioDiario({super.key});

  @override
  State<CalendarioDiario> createState() => _CalendarioDiarioState();
}

class _CalendarioDiarioState extends State<CalendarioDiario> {
  DateTime _selectedDay = DateTime.now();

  void _anteriorDia() {
    setState(() {
      _selectedDay = _selectedDay.subtract(const Duration(days: 1));
    });
  }

  void _siguienteDia() {
    setState(() {
      _selectedDay = _selectedDay.add(const Duration(days: 1));
    });
  }

  String _formatearFecha(DateTime fecha) {
    final meses = [
      "Enero",
      "Febrero",
      "Marzo",
      "Abril",
      "Mayo",
      "Junio",
      "Julio",
      "Agosto",
      "Septiembre",
      "Octubre",
      "Noviembre",
      "Diciembre"
    ];
    final dias = ["Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"];
    return "${dias[fecha.weekday - 1]} - ${fecha.day} ${meses[fecha.month - 1]} ${fecha.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBrown,
        title: const Text(
          "Calendario diario",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // Barra superior con íconos (mensual, semanal, diario)
          const BarraSuperiorCalendario(seleccionado: 2),

          const SizedBox(height: 20),

          // Fila con flechitas para cambiar de día
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: kBrown),
                  onPressed: _anteriorDia,
                ),
                Text(
                  _formatearFecha(_selectedDay),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: kBrown,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: kBrown),
                  onPressed: _siguienteDia,
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Lista de actividades del día
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.water_drop, color: kBrown),
                      SizedBox(width: 10),
                      Text("Riego 9:00", style: TextStyle(color: kBrown)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.grass, color: kBrown),
                      SizedBox(width: 10),
                      Text("Fertilizar 15:00", style: TextStyle(color: kBrown)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Botón "Nueva actividad"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBrown,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/registrar_actividad');
                },
                child: const Text(
                  "Nueva actividad",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BarraInferior(selectedIndex: 0),
    );
  }
}
