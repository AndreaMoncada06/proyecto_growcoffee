import 'package:flutter/material.dart';
import 'barra_inferior.dart';

class PantallaReportes extends StatefulWidget {
  @override
  _PantallaReportesState createState() => _PantallaReportesState();
}

class _PantallaReportesState extends State<PantallaReportes> {
  String? rangoSeleccionado = "Semanal";
  DateTime fechaInicio = DateTime(2025, 7, 7);
  DateTime fechaFin = DateTime(2025, 7, 11);
  final Color kBrown = const Color(0xFF6B3E2E);
  final Color kBackground = const Color(0xFFFCF5D8);

  void _ajustarFechaFinSegunRango() {
    setState(() {
      if (rangoSeleccionado == "Semanal") {
        fechaFin = fechaInicio.add(const Duration(days: 4)); // lunes-viernes
      } else if (rangoSeleccionado == "Quincenal") {
        fechaFin = fechaInicio.add(const Duration(days: 13)); // 14 días
      }
    });
  }

  Future<void> _seleccionarFechaInicio() async {
    DateTime? nuevaFecha = await showDatePicker(
      context: context,
      initialDate: fechaInicio,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('es', ''),
    );
    if (nuevaFecha != null) {
      setState(() {
        fechaInicio = nuevaFecha;
      });
      _ajustarFechaFinSegunRango();
    }
  }

  Future<void> _seleccionarFechaFin() async {
    DateTime? nuevaFecha = await showDatePicker(
      context: context,
      initialDate: fechaFin,
      firstDate: fechaInicio,
      lastDate: DateTime(2030),
      locale: const Locale('es', ''),
    );
    if (nuevaFecha != null) {
      setState(() {
        fechaFin = nuevaFecha;
      });
    }
  }

  String _formatearFecha(DateTime fecha) {
    const meses = [
      'ene',
      'feb',
      'mar',
      'abr',
      'may',
      'jun',
      'jul',
      'ago',
      'sep',
      'oct',
      'nov',
      'dic'
    ];
    return "${fecha.day}-${meses[fecha.month - 1]}-${fecha.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBrown,
        title: const Text(
          "Reportes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Dropdown Rango de fecha
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Rango de fecha",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade400),
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: rangoSeleccionado,
                        icon: Icon(Icons.arrow_drop_down, color: kBrown),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: "Semanal",
                            child: Text("Semanal"),
                          ),
                          DropdownMenuItem(
                            value: "Quincenal",
                            child: Text("Quincenal"),
                          ),
                        ],
                        onChanged: (valor) {
                          setState(() {
                            rangoSeleccionado = valor;
                          });
                          _ajustarFechaFinSegunRango();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Fecha inicio y fin
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Fecha",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _seleccionarFechaInicio,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white,
                            ),
                            child: Text(
                              _formatearFecha(fechaInicio),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.arrow_forward),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: _seleccionarFechaFin,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade400),
                              color: Colors.white,
                            ),
                            child: Text(
                              _formatearFecha(fechaFin),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Botones
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _botonAccion("Descargar como PDF", Icons.picture_as_pdf),
                  const SizedBox(height: 12),
                  _botonAccion("Descargar como Excel", Icons.table_chart),
                  const SizedBox(height: 12),
                  _botonAccion("Notificaciones", Icons.notifications),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(selectedIndex: 2),
    );
  }

  // Widget botón de acción
  Widget _botonAccion(String texto, IconData icono) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: kBrown,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        icon: Icon(icono, color: Colors.white),
        label: Text(texto, style: const TextStyle(color: Colors.white)),
        onPressed: () {},
      ),
    );
  }
}
