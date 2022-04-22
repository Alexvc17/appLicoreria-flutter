import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InsertCat extends StatefulWidget {
  
  @override
  _InsertCatState createState() => _InsertCatState();
}

class _InsertCatState extends State<InsertCat> {
// Creamos una  CollectionReference llamada categoria que hace referencia a la coleccion llamada categoria en firebase
CollectionReference categoria = FirebaseFirestore.instance.collection('categoria');
//definimos variables string
String desc;
String nomcat;
String origen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Categoria'),
      ),
      
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
         TextField(
           
            onChanged: (valuedesc){

                desc = valuedesc;

            },

            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa la descripcion',
              
            ),

          ),
          SizedBox(height: 24),
         TextField(

            onChanged: (valuenomdesc){//tomamos el valor del Textfield y lo guardamos en una variable string

                nomcat = valuenomdesc;

            },          
            
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el nombre',
            ),
          ),
          SizedBox(height: 24),
         TextField(

            onChanged: (valueorigen){

                origen = valueorigen;

            },          
            
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el origen',
            ),
          ),
          SizedBox(height: 32),
          FloatingActionButton(
            child: Text('Ingresa'),
            onPressed: () async{
             // aqui llama a la coleccion categoria para añadir nuevos datoss
              await categoria.add({

                'descripcion': desc,
                'nombreCategoria': nomcat,
                'origen':origen,


              }).then((value) => print('Datos agregados correctamente'));

              Navigator.pop(context);
            },
          ), 
        ],
      ),
    );
  }


  
}
