import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iseneca/src/Colors/colors.dart';
import 'package:iseneca/src/pages/alumnado_page.dart';

import 'src/pages/login_page.dart';
import 'src/pages/home_page.dart';
import 'src/pages/horario_page.dart';

main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: azulBase),
    );

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'iSéneca',
      theme: ThemeData(fontFamily: 'NunitoSans'),
      routes: {
        '/': (context) => LoginPage(),
        'home': (context) => HomePage(),
        'horario' : (context) => HorarioPage(),
        'alumno': (context, {String curso, }) => AlumnadoPage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
