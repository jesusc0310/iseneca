import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iseneca/src/Colors/colors.dart';
import 'package:iseneca/src/pages/alumnado_page.dart';

import 'src/pages/login_page.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: azulBase));

    return MaterialApp(
      title: 'iSeneca',
      routes: {}, //TODO: routes
      debugShowCheckedModeBanner: false,
      //initialRoute: , TODO: initialRoute
      home: AlumnadoPage(),

      ///[CAMBIAR EL NOMBRE DE LA PAGINA PARA PODER EJECUTAR EL PROGRAMA]
    );
  }
}
