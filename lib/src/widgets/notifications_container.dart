import 'package:flutter/material.dart';
import 'package:iseneca/src/colors/colors.dart';

class NotificationsContainer extends StatelessWidget {
  const NotificationsContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: azulClarito,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      height: 50,
      width: MediaQuery.of(context).size.width - 40,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 50,
            child: Container(
              child: Row(
                children: [
                  Image(
                    height: 20,
                    image: AssetImage('assets/icons/home_notif_aviso.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Avisos',
                    style: TextStyle(
                      color: blanco,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5,
            left: 60,
            child: Container(
              padding: EdgeInsets.all(2),
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: rojo,
              ),
              child: Text(
                '3',
                style: TextStyle(
                  color: blanco,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: MediaQuery.of(context).size.width / 2 - 20,
            child: Container(
              height: 30,
              width: 0.5,
              color: blanco,
            ),
          ),
          Positioned(
            top: 15,
            left: 200,
            child: Container(
              child: Row(
                children: [
                  Image(
                    height: 20,
                    image: AssetImage('assets/icons/home_notif_alert.png'),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Justificaciones',
                    style: TextStyle(
                      color: blanco,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
