import 'package:flutter/material.dart';
import 'package:growcoffee/registrar_insumo.dart';
import 'barra_inferior.dart';

class PantallaInventario extends StatelessWidget {
  const PantallaInventario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color kBrown = Color(0xFF7B3A23);
    const Color kLightYellow = Color(0xFFFCF5D8);

    final List<Map<String, String>> insumos = [
      {"nombre": "Fertilizantes", "cantidad": "3 Ud."},
      {"nombre": "Palas", "cantidad": "5 Ud."},
      {"nombre": "Mangueras", "cantidad": "2 Ud."},
      {"nombre": "Insecticidas", "cantidad": "1 Ud."},
    ];

    return Scaffold(
      backgroundColor: kLightYellow,
      appBar: AppBar(
        backgroundColor: kBrown,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Inventario",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Lista de insumos",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kBrown,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Lista de insumos
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: insumos.length,
                itemBuilder: (context, index) {
                  final item = insumos[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["nombre"]!,
                          style: const TextStyle(fontSize: 16, color: kBrown),
                        ),
                        Text(
                          "Cantidad ${item["cantidad"]!}",
                          style: const TextStyle(fontSize: 14, color: kBrown),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Botón grande y centrado
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBrown,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const PantallaRegistrarInsumo()),
                    );
                  },
                  child: const Text(
                    "Registrar insumo",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BarraInferior(selectedIndex: 3),
    );
  }
}
