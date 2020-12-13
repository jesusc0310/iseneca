// To parse this JSON data, do
//
//     final horarios = horariosFromJson(jsonString);

import 'dart:convert';


Horarios horariosFromJson(String str) => Horarios.fromJson(json.decode(str));

String horariosToJson(Horarios data) => json.encode(data.toJson());

class Horarios {
    Horarios({
        this.err,
        this.mensaje,
        this.dia,
        this.fecha,
        this.horario,
    });

    bool err;
    String mensaje;
    String dia;
    String fecha;
    List<Horario> horario;

    factory Horarios.fromJson(Map<String, dynamic> json) => Horarios(
        err: json["err"],
        mensaje: json["mensaje"],
        dia: json["dia"],
        fecha: json["fecha"],
        horario: List<Horario>.from(json["horario"].map((x) => Horario.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "err": err,
        "mensaje": mensaje,
        "dia": dia,
        "fecha": fecha,
        "horario": List<dynamic>.from(horario.map((x) => x.toJson())),
    };
}

class Horario {
    Horario({
        this.hInicio,
        this.hFinal,
        this.asignatura,
        this.curso,
        this.numAlumnos,
    });

    String hInicio;
    String hFinal;
    String asignatura;
    String curso;
    String numAlumnos;

    factory Horario.fromJson(Map<String, dynamic> json) => Horario(
        hInicio: json["h_inicio"],
        hFinal: json["h_final"],
        asignatura: json["asignatura"],
        curso: json["curso"],
        numAlumnos: json["num_alumnos"],
    );

    Map<String, dynamic> toJson() => {
        "h_inicio": hInicio,
        "h_final": hFinal,
        "asignatura": asignatura,
        "curso": curso,
        "num_alumnos": numAlumnos,
    };
}
