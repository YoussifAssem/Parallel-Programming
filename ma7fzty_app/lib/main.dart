import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ma7fzty_app/Screens/login_screen.dart';
import 'package:ma7fzty_app/Screens/signup_screen.dart';
import 'package:ma7fzty_app/Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp(
      routes: {
        

        '/logIn': (context) =>logIn(),


      },
      home: logIn(),
    //home: Splash(),
   //home:SignUp(),
    );
  }
}