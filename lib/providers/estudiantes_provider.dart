import 'dart:convert';

import 'package:flutter/services.dart';


class EstudiantesProvider{

  Future<List<dynamic>>cargarDatosEstudiantes() async {
    final datosEstudiantes = await rootBundle.loadString('data/estudiantes.json');
    return json.decode(datosEstudiantes);

  }
}