// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';

import '../Models/user.dart';

class viewAmount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _viewAmount();
  }
}

class _viewAmount extends State<viewAmount> {
  User user = User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 209, 207, 207),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 71, 196, 79),
          title: const Text(
            'view amount ',
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
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        "please enter the phone number to view the amount of money",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 11,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(255, 71, 196, 79),
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 71, 196, 79)),
                        ),
                        child: const Text('view'),
                        onPressed: () {},
                      ),
                    ),
                  ])))
        ]));
  }
}
