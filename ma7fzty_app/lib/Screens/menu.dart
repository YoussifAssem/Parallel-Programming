// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/Screens/amount_screen.dart';
import 'package:ma7fzty_app/Screens/chat_screen.dart';
import 'package:ma7fzty_app/Screens/home_screen.dart';
import 'package:ma7fzty_app/Screens/login_screen.dart';
import 'package:ma7fzty_app/Screens/transfer_screen.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = <Widget>[
    homeScreen(),
    Chat(),
    transferMoney(),
    viewAmount(),
    logIn(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 4) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => logIn()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(247, 42, 42, 42),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(247, 42, 42, 42),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
            backgroundColor: Color.fromARGB(247, 42, 42, 42),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Transfer Money',
            backgroundColor: Color.fromARGB(247, 42, 42, 42),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_array),
            label: 'view Amount',
            backgroundColor: Color.fromARGB(247, 42, 42, 42),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Log Out',
            backgroundColor: Color.fromARGB(247, 42, 42, 42),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
