// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:ma7fzty_app/Models/normal_user.dart';
import 'package:ma7fzty_app/Models/wallet.dart';
import 'package:ma7fzty_app/Models/admin_user.dart';

//Wallet w = Wallet();
Admin a = Admin();

class Screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    a.openWallet("sara@miu.com", "01289012609", 30.25);
    //a.removeWallet("ganna@miu.com", "01123456521");
    //a.addMoney("menna@miu.com", "01245678906", 4.5);
    //print("money added");
    return _Screen();
  }
}

class _Screen extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 71, 196, 79),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ma7fazty",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            Image.asset(
              'images/logo.png',
              height: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
