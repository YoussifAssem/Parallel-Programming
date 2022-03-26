// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/webui/amount_screen.dart';
import 'package:ma7fzty_app/webui/chat_screen.dart';
import 'package:ma7fzty_app/webui/home_screen.dart';
import 'package:ma7fzty_app/webui/login_screen.dart';
import 'package:ma7fzty_app/webui/transfer_screen.dart';

// ignore_for_file: unused_field, use_key_in_widget_constructors
class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _Menu();
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 71, 196, 79),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homeScreen()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('chat'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.money),
              title: const Text('transfermoney'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => transferMoney()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.balance),
              title: const Text('amount'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => viewAmount()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => logIn()),
                );
              }),
        ],
      ),
    );
  }
}
