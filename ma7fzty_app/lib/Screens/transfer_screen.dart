// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma7fzty_app/Models/normal_user.dart';

class transferMoney extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _transferMoney();
  }
}

class _transferMoney extends State<transferMoney> {
  String dropdownvalue = 'Item 1';
  normalUser user = normalUser();
  final pN = TextEditingController();
  final amount = TextEditingController();
  late String text;
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(247, 42, 42, 42),
        /*  appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 71, 196, 79),
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
                  child: const Text('Transfer Money'))
            ],
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
        ),*/
        body: Container(
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
                    'Transfer Money',
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  // keyboardType: TextInputType.emailAddress,
                  // controller: pN,
                  maxLength: 11,
                  controller: pN,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.deny(RegExp('[^0-9]')),
                  ],
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
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: amount,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  maxLength: 11,
                  //  inputFormatters: <TextInputFormatter>[
                  //  FilteringTextInputFormatter.deny(RegExp('[^0-9]')),
                  //],

                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.money_off_sharp,
                      color: Colors.white,
                    ),
                    //suffixText: Text($EGP'),
                    suffixText: 'EGP',

                    filled: true,

                    hintText: 'Cash Ammount',
                    hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 3, 81, 15)),
                    ),
                    child: const Text('Transfer'),
                    onPressed: () async {
                      await user.sendDataToPython(pN.text, amount.text);
                      if (pN.text == '' || amount.text == '') {
                        text = 'Error, Please Fill all Requirements';
                        showAlertDialog(context);
                      } else if (pN.text.length < 11) {
                        text = 'Error, Phone Number is less Than 11 numbers';
                        showAlertDialog(context);
                      } else {
                        if (await user.transferMoney(
                                phoneNumber: pN.text,
                                amount: double.parse(amount.text)) ==
                            'Done') {
                          text = 'Done, Data Iserted Successfully';

                          showAlertDialog(context);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
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
