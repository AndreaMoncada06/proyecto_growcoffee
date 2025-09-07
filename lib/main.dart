import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:growcoffee/calendario_mensual.dart';
import 'package:growcoffee/pantalla_bienvenida.dart';
import 'package:growcoffee/pantalla_login.dart';
import 'package:growcoffee/pantalla_principal.dart';
import 'package:growcoffee/pantalla_registro.dart';
import 'package:growcoffee/calendario_semanal.dart';
import 'package:growcoffee/calendario_diario.dart';
import 'package:growcoffee/registrar_actividad.dart';
import 'package:growcoffee/pantalla_reportes.dart';
import 'package:growcoffee/pantalla_inventario.dart';
import 'package:growcoffee/registrar_insumo.dart';

void main() {
  runApp(GrowCoffeeApp());
}

class GrowCoffeeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GrowCoffee',
      initialRoute: '/',
      routes: {
        '/': (context) => PantallaBienvenida(),
        '/login': (context) => PantallaLogin(),
        '/registro': (context) => PantallaRegistro(),
        '/principal': (context) => PantallaPrincipal(),
        '/calendario_mensual': (context) => CalendarioMensual(),
        '/calendario_semanal': (context) => CalendarioSemanal(),
        '/calendario_diario': (context) => CalendarioDiario(),
        '/registrar_actividad': (context) => RegistrarActividad(),
        '/reportes': (context) => PantallaReportes(),
        '/inventario': (context) => PantallaInventario(),
        '/registrar_insumo': (context) => PantallaRegistrarInsumo(),
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('es', ''), // Español
        Locale('en', ''), // Inglés
      ],
    );
  }
}
