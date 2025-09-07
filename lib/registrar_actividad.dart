import 'package:flutter/material.dart';

class RegistrarActividad extends StatefulWidget {
  final DateTime? fechaInicial;

  const RegistrarActividad({Key? key, this.fechaInicial}) : super(key: key);

  @override
  _RegistrarActividadState createState() => _RegistrarActividadState();
}

class _RegistrarActividadState extends State<RegistrarActividad> {
  final _nombreController = TextEditingController();
  final _observacionesController = TextEditingController();

  DateTime _fecha = DateTime.now();
  TimeOfDay _horaInicio = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay _horaFin = const TimeOfDay(hour: 8, minute: 0);

  @override
  void initState() {
    super.initState();
    if (widget.fechaInicial != null) {
      _fecha = widget.fechaInicial!;
    }
  }

  _seleccionarFecha() async {
    DateTime? seleccionada = await showDatePicker(
      context: context,
      initialDate: _fecha,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (seleccionada != null) {
      setState(() {
        _fecha = seleccionada;
      });
    }
  }

  _seleccionarHoraInicio() async {
    TimeOfDay? seleccionada = await showTimePicker(
      context: context,
      initialTime: _horaInicio,
    );
    if (seleccionada != null) {
      setState(() {
        _horaInicio = seleccionada;
      });
    }
  }

  _seleccionarHoraFin() async {
    TimeOfDay? seleccionada = await showTimePicker(
      context: context,
      initialTime: _horaFin,
    );
    if (seleccionada != null) {
      setState(() {
        _horaFin = seleccionada;
      });
    }
  }

  _guardarActividad() {
    // Aquí podrías guardar en tu base de datos o lista local
    Navigator.pop(context, {
      'nombre': _nombreController.text,
      'fecha': _fecha,
      'horaInicio': _horaInicio,
      'horaFin': _horaFin,
      'observaciones': _observacionesController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF5D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B4513),
        title: const Text("Registrar actividad"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nombre de la actividad"),
              TextField(controller: _nombreController),
              const SizedBox(height: 20),
              const Text("Fecha"),
              InkWell(
                onTap: _seleccionarFecha,
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  child: Text("${_fecha.day}-${_fecha.month}-${_fecha.year}"),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Hora duración"),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: _seleccionarHoraInicio,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        child: Text(_horaInicio.format(context)),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("→"),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: _seleccionarHoraFin,
                      child: InputDecorator(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        child: Text(_horaFin.format(context)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Observaciones"),
              TextField(
                controller: _observacionesController,
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                  ),
                  onPressed: _guardarActividad,
                  child: const Text("Guardar actividad"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
