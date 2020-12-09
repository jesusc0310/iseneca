import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:iseneca/src/Alumno.dart';

class _AlumnoProvider {
  List<Alumno> opciones = [];

  _AlumnoProvider() {
    cargarDatos();
  }

  Future<List<AlumnoElement>> cargarDatos() async {
    Response resp = await http.get('https://flutter-varios-1d375.firebaseio.com/.json');
    final datos = alumnoFromJson(resp.body);
    return datos.alumnos;
  }
}

final alumnoProvider = new _AlumnoProvider();