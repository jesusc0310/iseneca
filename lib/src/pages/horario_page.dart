import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iseneca/src/Colors/colors.dart';
import 'package:iseneca/src/model/Horarios.dart';
import 'package:iseneca/src/providers/horario_provider.dart';

class HorarioPage extends StatefulWidget {
  @override
  _HorarioPageState createState() => _HorarioPageState();
}

class _HorarioPageState extends State<HorarioPage> {
  @override
  void initState() {
    Timer.periodic(new Duration(seconds: 60), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: horariosProvider.getHorarios(),
        builder: (BuildContext context, AsyncSnapshot<Horarios> snapshot) {
          return (!snapshot.hasData)
              ? Center(child: CircularProgressIndicator())
              : Stack(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        appBarHorario(snapshot.data.dia, snapshot.data.fecha),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Horario lectivo",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (int i = 0; i < snapshot.data.horario.length; i++)
                          contenedor(snapshot.data.horario[i], snapshot.data.dia, snapshot.data.fecha),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Eventos",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(120, 20, 0, 0),
                          child: Text(
                            "No hay eventos disponibles",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                  Positioned(
                    bottom: 70,
                    right: 20,
                    child: FloatingActionButton(
                      child: Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ),
                ]);
        },
      ),
    );
  }

  Widget contenedor(Horario horario, String dia, String fecha) {
    var backColor = chooseBackColor(horario.hInicio, horario.hFinal);
    var fontColor1 =
        (backColor == gris) ? negro : blanco;
    var fontColor2 =
        (backColor == gris) ? Colors.grey : azulClarito;
    var asigCurso = (horario.curso == 'Guardia')
        ? horario.curso
        : '${horario.asignatura}-[${horario.curso}]';
    var numAlumnos = (horario.curso == 'Guardia')
        ? '${horario.numAlumnos}'
        : '${horario.numAlumnos} alumnos';
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        'alumno',
        arguments: <String, String>{
          'asignatura': horario.asignatura,
          'curso': horario.curso,
          'horaInicio' : horario.hInicio,
          'horaFinal' : horario.hFinal,
          'dia' : dia,
          'fecha' : fecha
        },
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
              color: backColor, borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      horario.hInicio,
                      style: TextStyle(color: fontColor1),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      horario.hFinal,
                      style: TextStyle(
                          color: fontColor2, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      asigCurso,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: fontColor1),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      numAlumnos,
                      style: TextStyle(
                          color: fontColor2, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarHorario(String dia, String fecha) {
    var date = DateTime.now();
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(color: azulBase),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.arrow_left,
            color: Colors.white,
            size: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 45,
              ),
              Text(
                dia,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue[400],
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    fecha,
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
    );
  }

  Color chooseBackColor(String inicio, String fin) {
    var backColor = gris;
    var now = DateTime.now();
    var horaInicio = (now.day < 10)
        ? DateTime.parse("${now.year}-${now.month}-0${now.day} $inicio:00")
        : DateTime.parse("${now.year}-${now.month}-${now.day} $inicio:00");
    var horaFin = (now.day < 10)
        ? DateTime.parse("${now.year}-${now.month}-0${now.day} $fin:00")
        : DateTime.parse("${now.year}-${now.month}-${now.day} $fin:00");

    if (now.isAfter(horaInicio) && now.isBefore(horaFin))
      backColor = azulBase;

    return backColor;
  }
}
