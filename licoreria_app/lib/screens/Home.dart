import 'package:flutter/material.dart';
import 'package:licoreria_app/screens/Inicio.dart';
import 'package:licoreria_app/screens/InsertCat.dart';
import 'package:licoreria_app/screens/InsertProd.dart';
import 'package:licoreria_app/screens/Login.dart';



class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: "/",
      routes: {
        //aqui solo estoy inicializando y dando nombre a las rutas
        "/": (BuildContext context) => Login(),
        "/inicio": (BuildContext context) => Inicio(),
        "/InsertCat": (BuildContext context) => InsertCat(),
        "/InsertProd": (BuildContext context) => InsertProd(),
        
        
      },
    );
  }
}