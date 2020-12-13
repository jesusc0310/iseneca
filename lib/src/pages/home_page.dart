import 'package:flutter/material.dart';
import 'package:iseneca/src/colors/colors.dart';
import 'alumnado_page.dart';
import 'views/home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _children;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _children = [
      HomeView(),
      AlumnadoPage(),
      Container(
        color: azulOscuro,
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        color: azulMuyOscuro,
        height: double.infinity,
        width: double.infinity,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blanco,
      body: _children[_currentIndex],
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
            activeIcon: ImageIcon(AssetImage('assets/icons/comunicaciones_on.png')),
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
}
