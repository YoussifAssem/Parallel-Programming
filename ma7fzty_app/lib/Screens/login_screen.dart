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
         //  backgroundColor: Color.fromARGB(247, 7, 85, 58),
          //  backgroundColor: Color.fromARGB(247, 255, 232, 82),
            // backgroundColor: const Color.fromARGB(247, 42, 42, 42),
         //   backgroundColor: Color.fromARGB(247, 134, 162, 152),
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
            body: Container(
             width:double.infinity,
                height:double.infinity,
  
    decoration: BoxDecoration(
        gradient:LinearGradient(
            colors: [
              
           const Color.fromARGB(247, 42, 42, 42),
              Color.fromARGB(247, 110, 110, 110),
              const Color.fromARGB(247, 42, 42, 42),
            //add more colors for gradient
            ],
          
        ),
    ),
              child: Card(
  margin: const EdgeInsets.all(50),
        elevation: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(51),
        ),
        color:Colors.white,
                child: ListView(
                  children: [
                  Container(
                    padding: const EdgeInsets.only(left: 40, top: 25, right: 40),
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: Column(
                        children: [
                           const Padding(
        padding: EdgeInsets.all(0.0),
        child: Icon(
          Icons.person_outline,
          color:  const Color.fromARGB(255, 3, 81, 15),
          size: 100,
        ),
      ),
      // ignore: prefer_const_constructors
      Padding(
        padding: const EdgeInsets.all(2.0),
        child:const  Text(
          "Costumer Login",
          style: TextStyle(
                color: Color.fromARGB(149, 0, 0, 0),
                fontWeight: FontWeight.bold,
                fontSize: 30,
          ),
        ),
      ),
                          const SizedBox(
                            height: 10,
                          ),
                          // const Center(
                          //   child: Text(
                          //     "Log In",
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontWeight: FontWeight.bold,
                          //         fontStyle: FontStyle.normal,
                          //         fontSize: 30),
                          //   ),
                          // ),
                          const SizedBox(height: 10), ///////////20
                          ///////////////////////container for sigun up here
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 30.0),
                            alignment: Alignment.center,
                            width: 150.0, //double.infinity, //150
                            height: 55.0,
                            decoration: BoxDecoration(
                              
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                gradient: LinearGradient(colors: [
                                 Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                ]),
                                
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    blurRadius: 16.0,
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color:  Color.fromARGB(255, 49, 49, 49),
                                  ),
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: Color.fromARGB(255, 49, 49, 49),
                                    blurRadius: 16.0,
                                  ),
                                ]),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                primary: Colors.red.withOpacity(0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(2),
                                  ),

                                  // side: BorderSide(color: Colors.white),
                                ),
                                //   style: ButtonStyle(
                                //    elevation: 0.0,
                                // primary: Colors.red.withOpacity(0),
                                //    // foregroundColor:MaterialStateProperty.resolveWith(Colors.amber),
                                //     shadowColor:MaterialStateProperty.all(Colors.transparent,),
                                //     surfaceTintColor :MaterialStateProperty.all(Colors.transparent,),
                                //     backgroundColor: MaterialStateProperty.all( Colors.transparent.withOpacity(0),),
                                //     overlayColor:MaterialStateProperty.all(Color.fromARGB(0, 0, 0, 0),),
                                //   //  MaterialStateProperty.all( Color.fromARGB(0, 3, 81, 15), ),
                              ),
                              child: const Text('Sign   Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18.0)),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => SignUp()),
                                );
                              },
                            ),
                            // ),
                          ),
                          const SizedBox(
                            height: 20, //50
                          ),
                          //////////////////////// EMAIL////////////////////////////////////////
Container(
        width: 320 , /// 310, //320
          height: 80 ,/// 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                   color: Colors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                      Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                      ])),
          child: Container(
                width:290, ///200,//290
                height: 60, ///50, //60
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Colors.white,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                 // showCursor: false,
                              // ignore: unnecessary_new
                              decoration: const InputDecoration(
                                 border: InputBorder.none,
                                
                           

                                //   borderRadius: BorderRadius.circular(10.0),
  //                           ),
    //                          border: const OutlineInputBorder(),
                                  
                                // labelStyle: new TextStyle(
                                //   color: Colors.blueGrey,
                                // ),
 
                                prefixIcon: Icon(
                                  Icons.email,
                                //  color: Color.fromARGB(247, 134, 162, 152),
                                  color:   Color.fromARGB(247, 42, 42, 42),
                                ),
                                filled: false,
                                hintText: 'Email',
                                hintStyle:
                                   // TextStyle(fontSize: 18, color: Color.fromARGB(247, 134, 162, 152),
                                    TextStyle(fontSize: 18, color: Color.fromARGB(247, 42, 42, 42)
                                    ),
                              ),
                              style: const TextStyle(
                                fontSize: 18,
                               // color: Color.fromARGB(247, 134, 162, 152),
                                color: Color.fromARGB(247, 42, 42, 42),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              controller: email,
                            ),
          ),
        ),
//                       Container(
//                         decoration: 
//                          BoxDecoration(
//   color: Colors.white,
//   border: Border.all(color: Colors.white),
//   borderRadius: BorderRadius.circular(32),
// ),
                            
                            
                            
//   //                       BoxDecoration(
//   // gradient: LinearGradient(colors: [Colors.black, Colors.redAccent]),
//   // border: Border.all(
//   //  // color: kHintColor,
//   // ),
//   // borderRadius: BorderRadius.circular(32) ),
//                         child: TextFormField(
//                           // ignore: unnecessary_new
//                           decoration: new InputDecoration(
//                             enabledBorder: OutlineInputBorder(
// borderRadius: const BorderRadius.all(Radius.circular(20)),

//                             //   borderRadius: BorderRadius.circular(10.0),
//                              ),
//                               border: const OutlineInputBorder(),
                                  
//                             // labelStyle: new TextStyle(
//                             //   color: Colors.blueGrey,
//                             // ),
 
//                             prefixIcon: Icon(
//                               Icons.email,
//                               color: Colors.white,
//                             ),
//                             filled: true,
//                             hintText: 'Email',
//                             hintStyle:
//                                 TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                           style: const TextStyle(
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           controller: email,
//                         ),
//                       ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
       width: 320,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                   color: Colors.white,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                   Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
             
                      ])),
          child: Container(
                width: 290,
                height:60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                 color: Colors.white,
                ),
                alignment: Alignment.center,
                child:   TextFormField(
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            //keyboardType: TextInputType.visiblePassword,
                            controller: password,
                            decoration: const InputDecoration(

 border: InputBorder.none,


                              
                              prefixIcon: Icon(
                                Icons.password,
                               // color:Color.fromARGB(247, 134, 162, 152),
                                color: Color.fromARGB(247, 42, 42, 42),
                              ),
                             filled: false,
                              hintText: 'Password',
                              hintStyle:
                                  TextStyle(fontSize: 18,
                                  // color:Color.fromARGB(247, 134, 162, 152),
                                   color: Color.fromARGB(247, 42, 42, 42),
                                  ),
                            ),
                            obscureText: true,
                          ),
          ),
        ),
                        
                         const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                                      width: 90.0, //double.infinity,
                                      height: 50.0,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                     Color.fromARGB(255, 3, 81, 15),
                                          ]),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              color:
                                                  Color.fromARGB(255, 91, 91, 91),
                                              blurRadius: 16.0,
                                            ),
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              color:
                                                Color.fromARGB(255, 91, 91, 91),
                                              blurRadius: 16.0,
                                            ),
                                            BoxShadow(
                                              offset: Offset(0, 0),
                                              color: Color.fromARGB(255, 91, 91, 91),
                                              blurRadius: 16.0,
                                            ),
                                          ]),

                            child: 
                            //SizedBox(
                             //   //height: 15,//45
                              //  child: Padding(
                                //  padding: const EdgeInsets.only(left: 0, right: 0),
                               //   child:
                                   ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0.0,
                                        primary: Colors.red.withOpacity(0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(2),
                                          ),
                                          // side: BorderSide(color: Colors.white),
                                        )
                                        // style:

                                        //  ButtonStyle(
                                        //   backgroundColor: MaterialStateProperty.all(
                                        //     const Color.fromARGB(255, 3, 81, 15),
                                        //   ),
                                        ),
                                    //////////////////////////////defto login
                                    child: 
                                       // margin: const EdgeInsets.symmetric( horizontal: 30.0), ///
                                      
                                         const Text('Log In'),
                                       
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
                                //),
                                //),
                          ),
                          
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),),);
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
