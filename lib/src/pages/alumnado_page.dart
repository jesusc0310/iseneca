import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iseneca/src/Alumno.dart';
import 'package:iseneca/src/Colors/colors.dart';
import 'package:iseneca/src/providers/alumnado_provider.dart';

class AlumnadoPage extends StatefulWidget {
  @override
  _AlumnadoPageState createState() => _AlumnadoPageState();
}

class _AlumnadoPageState extends State<AlumnadoPage> {
  final a = alumnoProvider;
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey[700]);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado Alumnos', style: TextStyle(color: Colors.white)),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        backgroundColor: azulOscuro,
        actions: [Icon(Icons.more_vert, color: Colors.white)],
      ),
      body: _listaAlumnos(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.check,
          size: 30.0,
        ),
      ),
    );
  }

  Widget _listaAlumnos() {
    return FutureBuilder(
        future: a.cargarDatos(),
        initialData: [],
        builder: (context, snapshot) {
          return ListView(
            children: _opciones(snapshot.data, context),
          );
        });
  }

  List<Widget> _opciones(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opcion) {
      final widgetTemp = ListTile(
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              opcion.nombre,
              style: estiloTitulo,
            ),
            Text(
              opcion.apellidos,
              style: estiloSubTitulo,
            )
          ]),
          leading: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                Padding(padding: EdgeInsets.all(25.0)),
                CircleAvatar(
                  backgroundImage: NetworkImage(opcion.urlFoto),
                ),
                (opcion.cumple)
                    ? Positioned(
                        left: 40,
                        bottom: 30,
                        child: Transform.rotate(
                          angle: 45.0,
                          child: FaIcon(
                            FontAwesomeIcons.crown,
                            color: amarillo,
                            size: 15,
                          ),
                        ),
                      )
                    : Positioned(
                        left: 40,
                        bottom: 30,
                        child: Transform.rotate(angle: 45.0, child: null),
                      )
              ]),
          trailing: FlatButton(
            color: (!opcion.asiste) ? Colors.transparent : rojo,
            shape: BeveledRectangleBorder(
                side: (!opcion.asiste)
                    ? BorderSide(color: gris, width: 1)
                    : BorderSide(color: rojo, width: 1),
                borderRadius: BorderRadius.circular(2)),
            onPressed: () {
              setState(() {
                (opcion.asiste) ? opcion.asiste = false : opcion.asiste = true;
              });
            },
            child: (!opcion.asiste)
                ? Text(
                    'Asiste',
                    style: TextStyle(color: gris, fontWeight: FontWeight.bold),
                  )
                : Text(
                    'Injustificada',
                    style:
                        TextStyle(color: blanco, fontWeight: FontWeight.bold),
                  ),
          ));
      opciones.add(widgetTemp);
      opciones.add(Divider(
        thickness: 1,
      ));
    });
    return opciones;
  }
}
