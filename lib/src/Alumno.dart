// To parse this JSON data, do
//
//     final alumno = alumnoFromJson(jsonString);

import 'dart:convert';

Alumno alumnoFromJson(String str) => Alumno.fromJson(json.decode(str));

String alumnoToJson(Alumno data) => json.encode(data.toJson());

class Alumno {
  Alumno({
    this.err,
    this.mensaje,
    this.alumnos,
  });

  bool err;
  String mensaje;
  List<AlumnoElement> alumnos;

  factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        err: json["err"],
        mensaje: json["mensaje"],
        alumnos: List<AlumnoElement>.from(
            json["alumnos"].map((x) => AlumnoElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "err": err,
        "mensaje": mensaje,
        "alumnos": List<dynamic>.from(alumnos.map((x) => x.toJson())),
      };
}

class AlumnoElement {
  AlumnoElement({
    this.nombre,
    this.apellidos,
    this.urlFoto,
    this.cumple,
    this.asiste = true,
  });

  String nombre;
  String apellidos;
  String urlFoto;
  bool cumple;
  bool asiste;

  factory AlumnoElement.fromJson(Map<String, dynamic> json) => AlumnoElement(
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        urlFoto: json["url_foto"],
        cumple: json["cumple"],
        //asiste: json["asiste"]
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellidos": apellidos,
        "url_foto": urlFoto,
        "cumple": cumple,
        //"asiste" : asiste
      };
}
