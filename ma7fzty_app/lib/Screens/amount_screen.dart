// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/Models/normal_user.dart';

class viewAmount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _viewAmount();
  }
}

class _viewAmount extends State<viewAmount> {
  normalUser user = normalUser();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(247, 42, 42, 42),
        /*
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
        ),*/
        body: ListView(children: [
          Container(
              padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(children: [
                    const Center(
                      child: Text(
                        "View Amount",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 30),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        "please enter the phone number to view the amount of money",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
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
                        filled: true,
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
                              const Color.fromARGB(255, 3, 81, 15)),
                        ),
                        child: const Text('view'),
                        onPressed: () {},
                      ),
                    ),
                  ])))
        ]));
  }
}
