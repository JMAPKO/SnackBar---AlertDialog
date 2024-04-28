//PRACTICA DE SNACKBAR
// MENSAJES, lo mas importante del metodo son los const


import 'package:flutter/material.dart';

void main(){
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "SnackBar",
      theme: ThemeData(
          useMaterial3: false,
          primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: _HomePage(title: "App - SnackBar"),
    );
  }
}

class _HomePage extends StatelessWidget{
   final String? title;
  const _HomePage({Key? key, required this.title}):super(key: key);

  final SnackBar practica = const SnackBar( //SI ESTA EL CONST NO DEBE TENER ACCION
      content: Text("Gracias por presionar el boton"),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.red,
  );

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar( // LA ACCION DEL CERRAR DEBE ESTAR DENTRO DEL BUILD
                    SnackBar(
                        content: Text("Mensaje SnackBar con Accion",style: TextStyle(color: Colors.red),),
                        duration: Duration(seconds: 5),
                      backgroundColor: Colors.black,
                        action: SnackBarAction(
                          onPressed: (){ScaffoldMessenger.of(context).hideCurrentSnackBar();},
                          label: "Cerrar",
                          textColor: Colors.white,
                        ),
                    )
                  );
                 } ,
                child: Text("Mostrar SnakeBar"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(color: Colors.white)
                ),
            )
          ],
        ),
      ),
    );
  }


}