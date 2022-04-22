import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InsertProd extends StatefulWidget {
  @override
  State<InsertProd> createState() => _InsertProdState();
}

class _InsertProdState extends State<InsertProd> {
  
  CollectionReference productos =
      FirebaseFirestore.instance.collection('productos');
  String formatoven;
  String stock;
  String tipoenv;
  String nomprod;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir Producto'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            onChanged: (valueformatoven) {
              formatoven = valueformatoven;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el Formato de venta',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            onChanged: (valuestock) {
              stock = valuestock;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el stock',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            onChanged: (valuetipoenv) {
              tipoenv = valuetipoenv;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el tipo de envase',
            ),
          ),
          SizedBox(height: 24),
          TextField(
            onChanged: (valuenomprod) {
              nomprod = valuenomprod;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ingresa el nombre del producto',
            ),
          ),
          SizedBox(height: 32),
          FloatingActionButton(
            child: Text('Ingresa'),
            onPressed: () async {
              
              await productos.add({
                'FormatoVenta': formatoven,
                'Stock': int.parse(stock),
                'TiponEnvase': tipoenv,
                'nombreProducto': nomprod,
              }).then((value) => print('Datos agregados correctamente'));

              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
