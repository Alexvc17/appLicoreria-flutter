import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:licoreria_app/screens/Inicio.dart';

//aqui inicializamos Firebase mediante un metodo asincrono
Future firebaseiniciacion() async {
  FirebaseApp initialization = await Firebase.initializeApp();
  return initialization;
}
//aqui obtenemos la identificacion del usuario actual de firebase 
Future firebaseUsuario() async{
  final usuario = await FirebaseAuth.instance.currentUser.email;
  return usuario;

}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: firebaseiniciacion(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

  FirebaseAuth auth = FirebaseAuth.instance;//creamos una instancia llamada firebase auth
  String email, contrasena; //creamos variables tipo string

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('assets/logologin.jpg'),
              height: 100,
            ),
          ),
          Text(
            "LICORERIA LUX",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Anton',
              fontSize: 44.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 44.0,
          ),
          TextField(
              
            //controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Correo Electrónico",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
              
            ),
            onChanged: (value){//tomamos el valor de lo que escribimos en el campo y lo guardamos en una variable string

                email = value;

            }, 
          ),
          SizedBox(
            height: 26.0,
          ),
          TextField(
            //controller: _passwordController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Contraseña",
              prefixIcon: Icon(Icons.lock, color: Colors.black),
            ),
            onChanged: (value){//tomamos el valor de lo que escribimos en el campo y lo guardamos en una variable string

                contrasena = value;

            }, 
          ),
          SizedBox(
            height: 50.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor: Color(0xFF5d091c),
              elevation: 14.0, //SOMBRA
              padding: EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              onPressed: () async {
           
                try{
                  //realiza la comparacion de los campos email y password
                    final user = await auth.signInWithEmailAndPassword(email: email.trim(), password: contrasena.trim());
                    if(user != null){//si es correcto pasa a la pagina de inicio
                      Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Inicio()));

                    }

                }catch(e){

                  print(e);


                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
