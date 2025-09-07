import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'barra_inferior.dart';
import 'barra_superior_calendario.dart';

class CalendarioSemanal extends StatefulWidget {
  const CalendarioSemanal({Key? key}) : super(key: key);

  @override
  _CalendarioSemanalState createState() => _CalendarioSemanalState();
}

class _CalendarioSemanalState extends State<CalendarioSemanal> {
  final Color kBackground = const Color(0xFFFCF5D8);
  final Color kBrown = const Color(0xFF6B3E2E);

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBrown,
        leading: const BackButton(color: Colors.white),
        title: const Text('Calendario semanal',
            style: TextStyle(color: Colors.white)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        ),
      ),
      body: Column(
        children: [
          // ✅ Reemplazo de la fila manual por el widget que ya tienes
          const BarraSuperiorCalendario(seleccionado: 1),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarFormat: CalendarFormat.week,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(color: kBrown, fontSize: 18),
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: kBrown,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
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
