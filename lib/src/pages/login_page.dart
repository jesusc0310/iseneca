import 'package:flutter/material.dart';
import 'package:iseneca/src/colors/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _pass = '0245';
  String _tecPass = '';

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    azulBase,
                    azulMuyOscuro,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/icons/login_logo_pad.png')),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 85),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          _counter >= 1
                              ? Icons.radio_button_on
                              : Icons.radio_button_off_outlined,
                          color: blanco,
                          size: 15,
                        ),
                        Icon(
                          _counter >= 2
                              ? Icons.radio_button_on
                              : Icons.radio_button_off_outlined,
                          color: blanco,
                          size: 15,
                        ),
                        Icon(
                          _counter >= 3
                              ? Icons.radio_button_on
                              : Icons.radio_button_off_outlined,
                          color: blanco,
                          size: 15,
                        ),
                        Icon(
                          _counter >= 4
                              ? Icons.radio_button_on
                              : Icons.radio_button_off_outlined,
                          color: blanco,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180),
              child: Column(
                children: [
                  fila1(),
                  fila2(),
                  fila3(),
                  fila4(),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              left: MediaQuery.of(context).size.width / 4,
              child: Image(
                height: 100,
                width: 180,
                image: AssetImage('assets/icons/juntalogo_login.png'),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      width: MediaQuery.of(context).size.width / 2,
                      height: 80,
                      color: azulBase,
                      child: Text(
                        'No soy cbarmor947',
                        style: TextStyle(
                          color: blanco,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {},
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width / 2,
                      height: 80,
                      color: blanco,
                      child: Text(
                        'Entrar con\n mi contraseña',
                        style: TextStyle(
                          color: azulBase,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fila1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _botton('1'),
        SizedBox(
          width: 20,
        ),
        _botton('2'),
        SizedBox(
          width: 20,
        ),
        _botton('3'),
      ],
    );
  }

  Widget fila2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _botton('4'),
        SizedBox(
          width: 20,
        ),
        _botton('5'),
        SizedBox(
          width: 20,
        ),
        _botton('6'),
      ],
    );
  }

  Widget fila3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _botton('7'),
        SizedBox(
          width: 20,
        ),
        _botton('8'),
        SizedBox(
          width: 20,
        ),
        _botton('9'),
      ],
    );
  }

  Widget fila4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _botonHuella(),
        SizedBox(
          width: 20,
        ),
        _botton('0'),
        SizedBox(
          width: 20,
        ),
        _botonBorrar(),
      ],
    );
  }

  Widget _botton(String value) {
    return FlatButton(
      shape: CircleBorder(side: BorderSide(color: blanco)),
      height: 100,
      color: null,
      textColor: blanco,
      child: Text(
        value,
        style: TextStyle(fontSize: 24),
      ),
      onPressed: () => setState(() => _valida(value)),
    );
  }

  Widget _botonHuella() {
    return FlatButton(
      shape: CircleBorder(side: BorderSide(color: blanco)),
      color: null,
      textColor: blanco,
      height: 100,
      child: Image(
        height: 50,
        image: AssetImage('assets/icons/login_print.png'),
      ),
      onPressed: () => setState(() => {}),
    );
  }

  Widget _botonBorrar() {
    return FlatButton(
      shape: CircleBorder(side: BorderSide(color: blanco)),
      height: 100,
      color: null,
      textColor: blanco,
      child: Image(
        height: 50,
        image: AssetImage('assets/icons/login_delete.png'),
      ),
      onPressed: () => setState(() {
        // ignore: unnecessary_statements
        _counter < 1 ? null : _counter--;
        _tecPass = _tecPass.substring(0, _tecPass.length - 1);
      }),
    );
  }

  void _valida(String value) {
    _counter++;
    _tecPass += value;

    if (_counter == 4) {
      if (_pass == _tecPass)
        Navigator.pushReplacementNamed(context, 'home');
      else {
        _tecPass = '';
        _counter = 0;
      }
    }
  }
}
