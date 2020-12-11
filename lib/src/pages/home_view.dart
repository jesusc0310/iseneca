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
        ],
      ),
    );
  }
}
