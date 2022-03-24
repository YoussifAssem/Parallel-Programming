import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma7fzty_app/Models/user.dart';
import 'package:ma7fzty_app/Screens/login_screen.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  static const routeName = "/dashboard";
  
  void _showDialog() {
    Future.delayed(Duration(seconds: 2), () {
    //Navigator.of(context).pushNamed(logIn());
    Navigator.pushNamed(context, '/logIn');
    });
  }

  @override
  void initState() {
    super.initState();
      _showDialog();
  }

  @override
  Widget build(BuildContext context) {
    return  
     Scaffold(
       backgroundColor: const Color.fromARGB(255, 71, 196, 79),
        body: Center(
          child: Column(
            children: [
              
               Center(
                 child:
                  ClipRRect(
                                        //borderRadius: new BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'images/logo.png',
                                          height:MediaQuery.of(context).size.height,  
                                          //width: double.infinity,
                                        ),
                                      ),
               ),
            ],
          ),
        ),
    );
  }
}


// FittedBox(
//   child: Image.asset('foo.png'),
//   fit: BoxFit.fill,
// )

// ClipRRect(
//                                         //borderRadius: new BorderRadius.circular(8.0),
//                                         child: Image.asset(
//                                           'images/splash.jpg',
//                                           height:MediaQuery.of(context).size.height,  
//                                           //width: double.infinity,
//                                         ),
//                                       ),