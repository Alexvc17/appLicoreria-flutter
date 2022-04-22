import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStyle{

static Color bgColor = Color(0xFFe2e2fe);
static Color mainColor = Color(0xFF5d091c);
static Color accentColor = Color(0xFF00065FF);

//estilos de las cards

static List<Color> cardsColor = [
  Colors.white,
  Colors.red.shade100,
  Colors.pink.shade100,
  Colors.orange.shade100,
  Colors.yellow.shade100,
  Colors.green.shade100,
  Colors.blue.shade100,
  Colors.grey.shade100,
  ];



//estilos del texto

static TextStyle titulo = 
TextStyle (
  fontFamily: 'Bungee',
  fontSize: 18.0,
  fontWeight: FontWeight.bold
);

static TextStyle contenido = 
TextStyle (
  fontFamily: 'Anton',
  fontSize: 18.0,
  fontWeight: FontWeight.bold
);

}