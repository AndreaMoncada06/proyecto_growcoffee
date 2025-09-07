import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'barra_inferior.dart';
import 'barra_superior_calendario.dart'; // 👈 importa la barra superior

const Color kBackground = Color(0xFFFCF5D8);
const Color kBrown = Color(0xFF6B3E2E);

class CalendarioMensual extends StatefulWidget {
  @override
  _CalendarioMensualState createState() => _CalendarioMensualState();
}

class _CalendarioMensualState extends State<CalendarioMensual> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,

      appBar: AppBar(
        backgroundColor: kBrown,
        title: const Text(
          "Calendario mensual",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: Column(
        children: [
          const SizedBox(height: 10),

          // Barra superior con los íconos (mensual, semanal, diario)
          const BarraSuperiorCalendario(seleccionado: 0),

          const SizedBox(height: 10),

          // Calendario
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: kBrown,
                shape: BoxShape.circle,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Lista de actividades
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
                      Icon(Icons.local_florist, color: kBrown),
                      SizedBox(width: 10),
                      Text("Riego 9:00", style: TextStyle(color: kBrown)),
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

      // Barra inferior
      bottomNavigationBar: const BarraInferior(selectedIndex: 0),
    );
  }
}
