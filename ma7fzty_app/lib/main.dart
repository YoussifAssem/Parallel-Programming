// ignore_for_file: use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//TO RUN MOBILE APP REMOVE THIS TWO COMMENTS
//import 'package:ma7fzty_app/Screens/login_screen.dart';
//import 'package:ma7fzty_app/Screens/splash_screen.dart';
//TO RUN WEB REMOVE  THIS TWO COMMENTS
import 'package:ma7fzty_app/webui/login_screen.dart';
import 'package:ma7fzty_app/webui/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TO RUN MOBILE APP REMOVE THIS COMMENT
  // await Firebase.initializeApp();
  //TO RUN WEB REMOVE THIS COMMENT
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDXmjTKQqlt7hPWEdkYgmKq8wz5_RK7jbQ",
    appId: "1:771679218479:web:57dcb99244d1e4b3ec4fda",
    messagingSenderId: "771679218479",
    projectId: "ma7fzty-65c0d",
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/logIn': (context) => logIn(),
      },
      home: const Splash(),
    );
  }
}
