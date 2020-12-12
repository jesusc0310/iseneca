import 'package:flutter/material.dart';
import 'package:iseneca/src/widgets/profe_info_container.dart';
import 'package:iseneca/src/widgets/notifications_container.dart';
import 'package:iseneca/src/colors/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              color: azulBase,
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 3 - 10,
            top: 25,
            child: Image(
              height: 45,
              image: AssetImage('assets/icons/ic_dash_logo_blanco.png'),
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: ProfeInfoContainer(),
          ),
          Positioned(
            top: 200,
            left: 20,
            child: NotificationsContainer(),
          ),
          Positioned(
            top: 320,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  decoration: BoxDecoration(
                    color: blanco,
                    border: Border(
                      right: BorderSide(color: gris),
                      bottom: BorderSide(color: gris),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage('assets/icons/db_alumnos.png'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Alumnado',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'alumno'),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width / 3 - 10,
                    decoration: BoxDecoration(
                      color: blanco,
                      border: Border(
                        right: BorderSide(color: gris),
                        bottom: BorderSide(color: gris),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          height: 50,
                          image: AssetImage('assets/icons/db_asistencia.png'),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Ausencias',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  decoration: BoxDecoration(
                    color: blanco,
                    border: Border(
                      bottom: BorderSide(color: gris),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage('assets/icons/db_notas.png'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Calificaciones',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 520,
            left: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  decoration: BoxDecoration(
                    color: blanco,
                    border: Border(
                      right: BorderSide(color: gris),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage('assets/icons/db_tablon.png'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Tablón de\nAnuncios',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3 - 10,
                  decoration: BoxDecoration(
                    color: blanco,
                    border: Border(
                      right: BorderSide(color: gris),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage('assets/icons/ic_covid.png'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Información Covid',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 3 - 15,
                  decoration: BoxDecoration(
                    color: blanco,
                    border: Border(
                      bottom: BorderSide(color: gris),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 50,
                        image: AssetImage('assets/icons/db_cuaderno.png'),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Cuaderno',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
