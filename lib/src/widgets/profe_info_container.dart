import 'package:flutter/material.dart';
import 'package:iseneca/src/colors/colors.dart';

class ProfeInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blanco,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      height: 100,
      width: MediaQuery.of(context).size.width - 40,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Barroso Moriana, Carlos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            child: Text(
              'I.E.S. - Fernando III,',
              style: TextStyle(
                color: azulOscuro,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 20,
            child: Text(
              'Perfil Profesorado,',
              style: TextStyle(
                color: azulOscuro,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: [
                Image(
                  height: 10,
                  image: AssetImage('assets/icons/ic_dropdown_arrow_black.png'),
                ),
                Image(
                  height: 20,
                  image: AssetImage('assets/icons/ic_user_group.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
