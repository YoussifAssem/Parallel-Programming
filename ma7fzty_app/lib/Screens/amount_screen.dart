// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

class viewAmount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _viewAmount();
  }
}

class _viewAmount extends State<viewAmount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 209, 207, 207),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[900],
          title: const Text(
            'View Amount Money',
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
            'View Amount Screen',
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ));
  }
}
