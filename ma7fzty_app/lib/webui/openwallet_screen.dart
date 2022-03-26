// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma7fzty_app/Models/admin_user.dart';
import 'package:ma7fzty_app/webui/menu.dart';

class openWallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _openWallet();
  }
}

class _openWallet extends State<openWallet> {
  Admin user = Admin();
  late String text;
  final pN = TextEditingController();
  final e = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Menu(),
        backgroundColor: const Color.fromARGB(255, 209, 207, 207),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 71, 196, 79),
          title: const Text(
            'Open Wallet',
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
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 400, top: 25, right: 400),
              //child: GestureDetector(
              //onTap: () {
              //FocusScope.of(context).unfocus();
              //},
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                      child: Text(
                    'Open Wallet',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 30),
                  )),
                  const SizedBox(height: 50),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    controller: e,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 71, 196, 79),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
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
                    controller: pN,
                    maxLength: 11,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.deny(RegExp('[^0-9]')),
                    ],
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone,
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
                    height: 25.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    //keyboardType: TextInputType.visiblePassword,
                    controller: amount,
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
                      hintText: 'Enter Amount',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 80, right: 80),
                      child: ElevatedButton(
                        child: const Text(
                          'Open Wallet',
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 71, 196, 79),
                          ),
                        ),
                        onPressed: () async => {
                          if (pN.text == '' ||
                              e.text == '' ||
                              amount.text == '')
                            {
                              text = 'Error, Please fill all requirements',
                              showAlertDialog(context),
                            }
                          else if (!e.text.contains('@'))
                            {
                              text = 'Email format is not applicable',
                              showAlertDialog(context),
                            }
                          else if (pN.text.length != 11)
                            {
                              text = ' Phone Number is less than 11 Numbers !',
                              showAlertDialog(context),
                            }
                          else
                            {
                              if (await user.openWallet(e.text, pN.text,
                                      double.parse(amount.text)) ==
                                  'Error')
                                {
                                  text =
                                      'Error Email is Not Exist OR There are an error in Data',
                                  showAlertDialog(context),
                                }
                              else
                                {
                                  text = 'Done, Wallet Opened Successfully',
                                  showAlertDialog(context),
                                }
                            }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //)
          ],
        ));
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
