import 'package:flutter/material.dart';

class PantallaRegistrarInsumo extends StatelessWidget {
  const PantallaRegistrarInsumo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color kBrown = Color(0xFF7B3A23);
    const Color kLightYellow = Color(0xFFFCF5D8);

    final TextEditingController nombreController = TextEditingController();
    final TextEditingController cantidadController = TextEditingController();

    return Scaffold(
      backgroundColor: kLightYellow,
      appBar: AppBar(
        backgroundColor: kBrown,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Registrar insumo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nombre del insumo",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: kBrown),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nombreController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Cantidad",
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: kBrown),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: cantidadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const Spacer(),
            SizedBox(
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
                  // Aquí iría la lógica para guardar el insumo
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Insumo registrado exitosamente")),
                  );
                  Navigator.pop(context); // Regresa a Inventario
                },
                child: const Text(
                  "Guardar",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
