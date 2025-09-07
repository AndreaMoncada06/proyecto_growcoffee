import 'package:flutter/material.dart';
import 'calendario_mensual.dart';
import 'calendario_semanal.dart';
import 'calendario_diario.dart';

class BarraSuperiorCalendario extends StatelessWidget {
  final int seleccionado; // 0 = mensual, 1 = semanal, 2 = diario

  const BarraSuperiorCalendario({Key? key, required this.seleccionado})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color kBackground = const Color(0xFFFCF5D8);

    return Container(
      color: kBackground,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              Icons.calendar_month,
              color: seleccionado == 0 ? Colors.orange : Colors.brown,
            ),
            onPressed: seleccionado == 0
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarioMensual()),
                    );
                  },
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.view_week,
              color: seleccionado == 1 ? Colors.orange : Colors.brown,
            ),
            onPressed: seleccionado == 1
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CalendarioSemanal()),
                    );
                  },
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: Icon(
              Icons.view_day,
              color: seleccionado == 2 ? Colors.orange : Colors.brown,
            ),
            onPressed: seleccionado == 2
                ? null
                : () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarioDiario()),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
