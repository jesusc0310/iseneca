import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:iseneca/src/model/Alumno.dart';

class _AlumnoProvider {
  List<Alumno> opciones = [];

  _AlumnoProvider() {
    cargarDatos();
  }

  Future<List<AlumnoElement>> cargarDatos() async {
    Response resp = await http.get('http://falcondptoinformatica.synology.me/Iseneca/index.php/Alumnos/Alumnos_listado');
    final datos = alumnoFromJson(resp.body);
    return datos.alumnos;
  }
}

final alumnoProvider = new _AlumnoProvider();