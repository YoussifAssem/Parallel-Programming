// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

class transferMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _transferMoney();
  }
}

class _transferMoney extends State<transferMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 209, 207, 207),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[900],
          title: const Text(
            'Transfer Money',
          ),
          actions: [
            Container(
              alignment: Alignment.centerRight,
              child: const Text(
                '',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            )
          ],
        ),
        body: const Center(
          child: Text(
            'Transfer Money Screen',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ));
  }
}
