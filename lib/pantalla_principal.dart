import 'package:flutter/material.dart';
import 'barra_inferior.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({Key? key}) : super(key: key);

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  final Color kBackground = const Color(0xFFFCF5D8);
  final Color kBrown = const Color(0xFF7B3A23);
  final Color kAccentGreen = const Color(0xFF6DBE69);

  List<String> activities = ['Actividad 1', 'Actividad 2'];
  List<Map<String, dynamic>> inventory = [
    {'label': 'Fertilizantes', 'icon': Icons.local_florist},
    {'label': 'Pesticidas', 'icon': Icons.bug_report},
    {'label': 'Herramientas', 'icon': Icons.build},
  ];
  List<String> tasks = ['Tarea 1', 'Tarea 2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,

      // 🔹 AppBar nativo
      appBar: AppBar(
        backgroundColor: kBrown,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        ),
        title: const Text(
          'Hoy, 7 de Julio',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // abrir ajustes
            },
          ),
        ],
      ),

      // 🔹 Contenido desplazable
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Actividades
            const Text(
              'Actividades de hoy',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Column(
              children: activities.map((a) => _activityCard(a)).toList(),
            ),

            const SizedBox(height: 16),

            // Inventario
            const Text(
              'Inventario',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 3,
              children: [
                ...inventory.map((i) => _inventoryCard(i)).toList(),
                _addInventoryCard(),
              ],
            ),

            const SizedBox(height: 16),

            // Tareas pendientes
            const Text(
              'Tareas pendientes',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Column(
              children: tasks.map((t) => _taskCard(t)).toList(),
            ),

            const SizedBox(height: 80), // Espacio para no chocar con nav bar
          ],
        ),
      ),

      // 🔹 BottomNavigationBar nativo
      bottomNavigationBar: const BarraInferior(selectedIndex: 1),
    );
  }

  Widget _activityCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: kAccentGreen, width: 2),
            ),
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _inventoryCard(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: kAccentGreen.withOpacity(0.12),
            child: Icon(item['icon'], color: kAccentGreen, size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(item['label'])),
          Icon(Icons.check_circle, color: kAccentGreen, size: 20),
        ],
      ),
    );
  }

  Widget _addInventoryCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: kBrown),
            const SizedBox(height: 6),
            const Text('Agregar más', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _taskCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.notifications_none, color: kBrown),
          const SizedBox(width: 10),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
