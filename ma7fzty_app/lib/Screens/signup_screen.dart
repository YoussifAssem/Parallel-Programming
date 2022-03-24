import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma7fzty_app/Models/user.dart';
import 'package:ma7fzty_app/Screens/login_screen.dart';

// ignore: use_key_in_widget_constructors
class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}

class _SignUp extends State<SignUp> {
  // ignore: unused_field

  User user = User();
  final pN = TextEditingController();
  final e = TextEditingController();
  final p = TextEditingController();
  final cP = TextEditingController();

  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: IconButton(
        //                 onPressed: () async {

        //                   Navigator.pushNamed(context, '/login');
        //                 }, icon: Icon(Icons.arrow_back),),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              const Text(
                ' SignUp',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          centerTitle: true,
          // automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 71, 196, 79),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
              //child: GestureDetector(
              //onTap: () {
              //FocusScope.of(context).unfocus();
              //},
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                      child: Text(
                    'Sign Up',
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
                    controller: p,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 71, 196, 79),
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    controller: cP,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(255, 71, 196, 79),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    obscureText: true,
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
                          'Sign Up',
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 71, 196, 79),
                          ),
                        ),
                        onPressed: () async => {
                          if (pN.text == '' ||
                              e.text == '' ||
                              p.text == '' ||
                              cP.text == '')
                            {
                              text = 'Error, Please fill all requirements',
                              showAlertDialog(context),
                            }
                          else if (p.text != cP.text)
                            {
                              text = 'Error, Password does not match',
                              showAlertDialog(context),
                            }
                          else if (!e.text.contains('@'))
                            {
                              text = 'Email format is not applicable',
                              showAlertDialog(context),
                            }
                          else if (p.text.length <= 6)
                            {
                              text = ' Weak Password !',
                              showAlertDialog(context),
                            }
                          else if (pN.text.length != 11)
                            {
                              text = ' Phone Number is less than 11 Numbers !',
                              showAlertDialog(context),
                            }
                          else
                            {
                              if (await user.signUp(
                                      phoneNumber: pN.text,
                                      email: e.text,
                                      password: p.text) ==
                                  'Error')
                                {
                                  text =
                                      'Error Email is Aleady Exist OR There are an error in Data',
                                  showAlertDialog(context),
                                }
                              else
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => logIn()),
                                  )
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
