import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PantallaLogin extends StatefulWidget {
  @override
  _PantallaLoginState createState() => _PantallaLoginState();
}

class _PantallaLoginState extends State<PantallaLogin> {
  String? _rolSeleccionado; // Para guardar el rol elegido
  final Color kBrown = const Color(0xFF6B3E2E);

  // Controladores de texto para usuario y contraseña
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController claveController = TextEditingController();

  // Función para hacer login al backend
  Future<void> login() async {
    if (_rolSeleccionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor selecciona un rol')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "usuario": usuarioController.text,
        "clave": claveController.text,
        "rol": _rolSeleccionado,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Login exitoso: $data");

      // Navega a la pantalla principal
      Navigator.pushNamed(context, '/principal');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en login: ${response.statusCode}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5D8),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/logo.png', height: 100),
            const Text(
              'growcoffee',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Bienvenido !!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextField(
                    controller: usuarioController,
                    decoration: const InputDecoration(labelText: 'Usuario'),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: claveController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Contraseña'),
                  ),
                  const SizedBox(height: 20),

                  // Menú desplegable con estilo
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                      color: const Color(0xFFFFF9E5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _rolSeleccionado,
                        hint: const Text(
                          'Selecciona tu rol',
                          style: TextStyle(color: Colors.grey),
                        ),
                        icon: Icon(Icons.arrow_drop_down, color: kBrown),
                        isExpanded: true,
                        items: const [
                          DropdownMenuItem(
                            value: 'Administrador',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Administrador'),
                                Icon(Icons.chevron_right, color: Colors.brown),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Caficultor',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Caficultor'),
                                Icon(Icons.chevron_right, color: Colors.brown),
                              ],
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'Equipo de Desarrollo',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Equipo de Desarrollo'),
                                Icon(Icons.chevron_right, color: Colors.brown),
                              ],
                            ),
                          ),
                        ],
                        onChanged: (valor) {
                          setState(() {
                            _rolSeleccionado = valor;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kBrown,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: login, // 👈 ahora llama al backend
                    child: const Text('Iniciar sesión'),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/registro');
                    },
                    child: const Text(
                      '¿Aún no tienes cuenta? Registrarse',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
