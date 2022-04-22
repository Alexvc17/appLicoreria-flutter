import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:licoreria_app/screens/Home.dart';
import 'package:licoreria_app/screens/Inicio.dart';
import 'package:licoreria_app/screens/Login.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();//iniciamos firebase
  await Firebase.initializeApp();

  runApp(MyApp());
  
}


class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}