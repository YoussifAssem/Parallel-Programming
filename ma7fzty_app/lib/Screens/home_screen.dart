// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/Models/user.dart';

class homeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _homeScreen();
  }
}

class _homeScreen extends State<homeScreen> {
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(247, 42, 42, 42),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(247, 42, 42, 42),
          title: const Text(
            'Home Page',
          ),
          actions: [
            Image.asset(
              'images/logo.png',
              fit: BoxFit.contain,
              height: 50,
              width: 50,
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.centerRight,
              child: Text(
                user.Email,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/logo.png"), fit: BoxFit.cover)),
          /* child: const TextField(
              decoration:
                 // InputDecoration(fillColor: Colors.green, filled: true),
            )*/
        ));
  }
}
