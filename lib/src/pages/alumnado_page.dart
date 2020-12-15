import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iseneca/src/model/Alumno.dart';
import 'package:iseneca/src/Colors/colors.dart';
import 'package:iseneca/src/providers/alumnado_provider.dart';

class AlumnadoPage extends StatefulWidget {
  @override
  _AlumnadoPageState createState() => _AlumnadoPageState();
}

class _AlumnadoPageState extends State<AlumnadoPage> {
  Future<List<AlumnoElement>> lista;
  final a = alumnoProvider;
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey[700]);

  @override
  void initState() {
    super.initState();
    lista = a.cargarDatos().then((value) => value);
  }

  Widget build(BuildContext context) {
    int _currentIndex = 1;
    final Map<String, String> mapa = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 85,
        title: Column(
          children: [
            Text(
              '${mapa['asignatura']} (${mapa['curso']})',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              '${mapa['horaInicio']} - ${mapa['horaFinal']} ${mapa['dia']} ${mapa['fecha'].substring(0, mapa['fecha'].length - 6)}',
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
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
        backgroundColor: azulOscuro,
        onPressed: null,
        child: Icon(
          Icons.check,
          size: 30.0,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: azulOscuro,
        selectedFontSize: 10,
        unselectedItemColor: grisOscuro,
        showUnselectedLabels: true,
        unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: ImageIcon(AssetImage('assets/icons/home.png')),
            activeIcon: ImageIcon(AssetImage('assets/icons/home_on.png')),
          ),
          BottomNavigationBarItem(
            label: 'Agenda',
            icon: ImageIcon(AssetImage('assets/icons/agenda.png')),
            activeIcon: ImageIcon(AssetImage('assets/icons/agenda_on.png')),
          ),
          BottomNavigationBarItem(
            label: 'Comunicaciones',
            icon: ImageIcon(AssetImage('assets/icons/comunicaciones.png')),
            activeIcon:
                ImageIcon(AssetImage('assets/icons/comunicaciones_on.png')),
          ),
          BottomNavigationBarItem(
            label: 'Menu',
            icon: ImageIcon(AssetImage('assets/icons/menu.png')),
            activeIcon: ImageIcon(AssetImage('assets/icons/menu_on.png')),
          ),
        ],
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }

  Widget _listaAlumnos() {
    final List<Widget> opciones = [];
    return FutureBuilder(
      future: lista,
      builder:
          (BuildContext context, AsyncSnapshot<List<AlumnoElement>> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        else {
          snapshot.data.forEach((opcion) {
            final widgetTemp = ListTile(
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        backgroundColor: Colors.transparent,
                        backgroundImage: (opcion.urlFoto == null)
                            ? AssetImage('assets/icons/list_photo_default.png')
                            : NetworkImage(opcion.urlFoto),
                      ),
                      (opcion.cumple)
                          ? Positioned(
                              left: 40,
                              bottom: 30,
                              child: Transform.rotate(
                                  angle: 45.0,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/icons/detail_cumple.png'),
                                    height: 23,
                                  )),
                            )
                          : Positioned(
                              left: 40,
                              bottom: 30,
                              child: Transform.rotate(angle: 45.0, child: null),
                            )
                    ]),
                trailing: FlatButton(
                  color: (opcion.asiste) ? Colors.transparent : rojo,
                  shape: BeveledRectangleBorder(
                      side: (opcion.asiste)
                          ? BorderSide(color: gris, width: 1)
                          : BorderSide(color: rojo, width: 1),
                      borderRadius: BorderRadius.circular(2)),
                  onPressed: () {
                    setState(() {
                      (!opcion.asiste)
                          ? opcion.asiste = true
                          : opcion.asiste = false;
                    });
                  },
                  child: (opcion.asiste)
                      ? Text(
                          'Asiste',
                          style: TextStyle(
                              color: gris, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Injustificada',
                          style: TextStyle(
                              color: blanco, fontWeight: FontWeight.bold),
                        ),
                ));
            opciones.add(widgetTemp);
            opciones.add(Divider(
              thickness: 1,
            ));
          });
          return ListView(
            children: opciones,
          );
        }
      },
    );
  }
}
