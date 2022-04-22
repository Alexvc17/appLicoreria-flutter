import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:licoreria_app/style/estilo_app.dart';

//iniciamos firebase con el metodo initializeapp
Future firebaseiniciacion() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}



class ProdCervezas extends StatefulWidget {
  

  @override
  State<ProdCervezas> createState() => _ProdCervezasState();
}

class _ProdCervezasState extends State<ProdCervezas> {
   //se crea una instancia la cual hace referencia a la coleccion llamada categoria
  CollectionReference productos =
      FirebaseFirestore.instance.collection('productos');
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: AppStyle.mainColor,
        appBar: AppBar(
          elevation: 10.5,
          title: Text("PRODUCTOS DISPONIBLES"),
          centerTitle: true,
          backgroundColor: AppStyle.mainColor,
     
        
        ),
        
  /////////////////////////////////////////////////////////////////////////////////////////
        body: Container(
          
          //aqui se llama a los metodos cards en forma de lista
          child: ListView( 
          
          scrollDirection: Axis.horizontal,
          children: <Widget>[
         
            cerveza1(),
            cerveza2(),
            cerveza3(),
            
          
          ],),
         
        )
   
        );
        
  }
   
 Card cerveza1() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(160),
      elevation: 10,
      child: Column(
        children: <Widget>[

          Image(
            image: AssetImage('assets/cerveza1.jpg'),
            fit: BoxFit.fitWidth,
            height: 240,
            
          ),
          //muestra los datos atraves de un future builder, indicando el id especifico de la coleccion productos
          FutureBuilder(
            future: productos.doc('hqrkGSHdizsFWUfMir1t').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //Si el documento existe, puede leer los datos llamando al método data, que devuelve un Map<String, dynamic>,
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                  "\n${data['nombreProducto']}"
                    "\n${data['FormatoVenta']} "
                    "\n${data['Stock']}"
                    "\n${data['TipoEnvase']}"
                    );
                    
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
         
        ],
      ),
    );
  }

   Card cerveza2() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(160),
      elevation: 10,
      child: Column(
        children: <Widget>[

          Image(
            image: AssetImage('assets/cerveza2.jpg'),
            fit: BoxFit.cover,
            height: 240,
          ),
          //muestra los datos atraves de un future builder, indicando el id especifico de la coleccion categoria
          FutureBuilder(
            future: productos.doc('jHnDobInUgwSbZOvvMqr').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //Si el documento existe, puede leer los datos llamando al método data, que devuelve un Map<String, dynamic>,
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                  "\n${data['nombreProducto']}"
                    "\n${data['FormatoVenta']} "
                    "\n${data['Stock']}"
                    "\n${data['TipoEnvase']}"
                    );
                    
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
         
        ],
      ),
    );
  }

     Card cerveza3() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(160),
      elevation: 10,
      child: Column(
        children: <Widget>[

          Image(
            image: AssetImage('assets/cerveza3.jpg'),
            fit: BoxFit.cover,
            height: 240,
          ),
          //muestra los datos atraves de un future builder, indicando el id especifico de la coleccion categoria
          FutureBuilder(
            future: productos.doc('uQcvYvfEv4N8XlexMYKh').get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                //Si el documento existe, puede leer los datos llamando al método data, que devuelve un Map<String, dynamic>,
                Map<String, dynamic> data = snapshot.data.data();
                print(data);
                return Text(
                  "\n${data['nombreProducto']}"
                    "\n${data['FormatoVenta']} "
                    "\n${data['Stock']}"
                    "\n${data['TipoEnvase']}"
                    );
                    
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
         
        ],
      ),
    );
  }
}