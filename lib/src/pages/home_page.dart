import 'package:flutter/material.dart';
import 'package:iseneca/src/colors/colors.dart';
import 'alumnado_page.dart';
import 'home_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _children;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: azulOscuro,
        unselectedItemColor: grisOscuro,
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            label: 'Agenda',
            icon: Icon(Icons.watch_later_outlined),
            activeIcon: Icon(Icons.watch_later),
          ),
          BottomNavigationBarItem(
            label: 'Comunicaciones',
            icon: Icon(Icons.menu),
            activeIcon: Icon(Icons.menu),
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
