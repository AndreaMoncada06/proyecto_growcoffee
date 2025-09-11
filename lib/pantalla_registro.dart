import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PantallaRegistro extends StatefulWidget {
  @override
  _PantallaRegistroState createState() => _PantallaRegistroState();
}

class _PantallaRegistroState extends State<PantallaRegistro> {
  // Controladores de texto
  final TextEditingController correoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController claveController = TextEditingController();

  // Función para enviar datos al backend
  Future<void> registrarUsuario() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:8080/api/registro'), // 👈 Ajusta tu endpoint
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "correo": correoController.text,
        "usuario": usuarioController.text,
        "clave": claveController.text,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Registro exitoso: $data");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro exitoso, inicia sesión')),
      );

      // Redirige al login
      Navigator.pushNamed(context, '/login');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en registro: ${response.statusCode}')),
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
              'Regístrate !!',
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
                    controller: correoController,
                    decoration:
                        const InputDecoration(labelText: 'Correo Electrónico'),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6B3E2E),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    onPressed: registrarUsuario, // 👈 ahora llama al backend
                    child: const Text('Registrarse'),
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
