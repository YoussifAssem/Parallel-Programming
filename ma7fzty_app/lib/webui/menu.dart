// ignore_for_file: unused_field, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/webui/chat_screen.dart';
import 'package:ma7fzty_app/webui/home_screen.dart';
import 'package:ma7fzty_app/webui/login_screen.dart';
import 'package:ma7fzty_app/webui/openwallet_screen.dart';
import 'package:ma7fzty_app/webui/removewallet_screen.dart';

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
          const SizedBox(height: 200),
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
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
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Chat()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Open Wallet'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => openWallet()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.money),
              title: const Text('Remove Wallet'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => removeWallet()),
                );
              }),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Logout'),
              iconColor: Colors.white,
              textColor: Colors.white,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => logIn()),
                );
              }),
        ],
      ),
    );
  }
}
