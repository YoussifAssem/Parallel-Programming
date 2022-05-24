// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/Models/normal_user.dart';
import 'package:ma7fzty_app/Screens/menu.dart';
import 'package:ma7fzty_app/Screens/signup_screen.dart';

class logIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _logIn();
  }
}

class _logIn extends State<logIn> {
  final email = TextEditingController();
  final password = TextEditingController();
  normalUser user = normalUser();
  late String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            backgroundColor: const Color.fromARGB(247, 42, 42, 42),
            /*
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                    height: 50,
                    width: 50,
                  ),
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('Ma7fzaty'))
                ],
              ),
              centerTitle: true,
              // automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 71, 196, 79),
            ),*/
            body: ListView(children: [
              Container(
                padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      const Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontSize: 30),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 3, 81, 15)),
                          ),
                          child: const Text('Sign Up Here'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          filled: true,
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        //keyboardType: TextInputType.visiblePassword,
                        controller: password,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                          filled: true,
                          hintText: 'Password',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                          height: 45,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 80, right: 80),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 3, 81, 15),
                                ),
                              ),
                              child: const Text('Log In'),
                              onPressed: () async {
                                if (email.text == '' || password.text == '') {
                                  text = 'Error, Please fill all requirements';
                                  showAlertDialog(context);
                                } else if (!email.text.contains('@')) {
                                  text = 'Email format is not true';
                                  showAlertDialog(context);
                                } else {
                                  if (await user.login(
                                          email.text, password.text) !=
                                      'Done') {
                                    text =
                                        'Error, Email or Password is incorrect';
                                    showAlertDialog(context);
                                  } else {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Menu()),
                                    );
                                  }
                                }
                              },
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ])));
  }

  showAlertDialog(
    BuildContext context,
  ) {
    // Create button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Alert"),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
