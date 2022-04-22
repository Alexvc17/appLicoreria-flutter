import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:licoreria_app/screens/Home.dart';
import 'package:licoreria_app/screens/InsertCat.dart';
import 'package:licoreria_app/screens/InsertProd.dart';
import 'package:licoreria_app/screens/Login.dart';
import 'package:licoreria_app/screens/ProdCervezas.dart';
import 'package:licoreria_app/style/estilo_app.dart';

//iniciamos firebase con el metodo initializeapp
Future firebaseiniciacion() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}

////aqui obtenemos la identificacion del usuario actual de firebase
Future firebaseUsuario() async {
  final usuario = await FirebaseAuth.instance.currentUser.email;
  return usuario;
}

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  //se crea una instancia la cual hace referencia a la coleccion llamada categoria
  CollectionReference categoria =
      FirebaseFirestore.instance.collection('categoria');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          elevation: 10.5,
          title: Text("LICORERIA LUX"),
          centerTitle: true,
          backgroundColor: AppStyle.mainColor,
          
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                _showDialog(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: Colors.white),
              onPressed: () {
                datosUsuario(context);
              },
            ),
          ],
        ),
        /////////////////////////////////////////////////////////////////////////////////////////
        body: ListView(
          //aqui se llama a los metodos cards en forma de lista
          children: <Widget>[
            Text(
              "\nCategorias de Licores",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Anton',
                fontSize: 30.0,
              ),
            ),
            cerveza(),
            brandy(),
            ron(),
            whisky(),
            aguardiente(),
            tequila(),
          ],
        ));
  }

//creamos metodos que nos devuelve cards
  Card cerveza() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
           FloatingActionButton(
            onPressed: () {
                 Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProdCervezas()));
            },
            child: Icon(Icons.arrow_drop_up, color: Colors.black
            ),
            mini: true,
          ),
          Image(
            image: AssetImage('assets/cerveza.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          //muestra los datos atraves de un future builder, indicando el id especifico de la coleccion categoria
          FutureBuilder(
            future: categoria.doc('0x0UUzhMr2yh2tIP4oPh').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //Si el documento existe, puede leer los datos llamando al método data, que devuelve un Map<String, dynamic>,
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
         
        ],
      ),
    );
  }

  Card brandy() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/brandy.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          FutureBuilder(
            future: categoria.doc('4tWwv66ETDgnPduBdIEp').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Card ron() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/ron.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          FutureBuilder(
            future: categoria.doc('EaU2UfKLZTlwfNSNuhrJ').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Card whisky() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/whisky.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          FutureBuilder(
            future: categoria.doc('IwuJdKEhbhdo69dIvGre').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Card aguardiente() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/aguardiente.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          FutureBuilder(
            future: categoria.doc('XxqwWUSgl40En9hl9K9W').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

  Card tequila() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/tequila.jpg'),
            fit: BoxFit.cover,
            height: 260,
          ),
          FutureBuilder(
            future: categoria.doc('eaGBD6qb5nMuHFJ69WdN').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                    "                                   ${data['nombreCategoria']} "
                    "/${data['origen']}"
                    "\n\n${data['descripcion']}"
                    "\n");
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }

//creamos un showdialog
  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              "Seleccione una opción",
              textAlign: TextAlign.center,
            ),
            children: [
              ListTile(
                  title: Text("Añadir Categoria"),
                  leading: Icon(Icons.category, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InsertCat()));
                  }),
              ListTile(
                  title: Text("Añadir Producto"),
                  leading: Icon(Icons.launch, color: Colors.black),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InsertProd()));
                  }),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: Colors.amber.shade100,
          );
        },
        barrierDismissible: true);
  }

  void datosUsuario(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(
              "Usuario",
              textAlign: TextAlign.center,
            ),
            children: [
              FutureBuilder(
                future: firebaseUsuario(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text("    Correo: ${snapshot.data}");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.exit_to_app, color: Colors.black),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            backgroundColor: Colors.amber.shade100,
          );
        },
        barrierDismissible: true);
  }

  Container mostrarDatos() {
    return Container(
      child: FutureBuilder(
        future: firebaseiniciacion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Inicio();
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
