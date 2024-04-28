//Hacer repaso de la creacion de los 3 forams de mandar mensajes de alerta
// las principales diferencias es que SnackBar tiene SnackAction, ademas el metodo para cerrar
// Es hideCurrentSnack() y en AlertDiag la forma de cerrar:es Navigator.Of(context).pop()

// el otro inicia ademas con ShowDialog y hace varias secuencias de "funciones"

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(SnakApp());
}

class SnakApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Alertas",
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: _myHome(title: "App - Alertas"),
    );
  }
}

class _myHome extends StatelessWidget{
  final String? title;
   _myHome ({Key? key, this.title}):super(key: key);

  String mensajeS = "Esto es un SnackBar";

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(8),
              child: Text("Botonos de Alertas para Anodrid e IOS", style: Theme.of(context).textTheme.titleMedium,),
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Text("Hay distintos tipos de formas de emitir notificaciones. "
                  "Uno de ellos es el SnackBar cuya funcion es un mensaje por debajo de nuestra App. Este tipo de mensajes son dentro de la misma pantalla "
                  "por tanto no existe o aparece el navigator. en ellos utilizamos la funcion showSnakeBar",
                style: Theme.of(context).textTheme.labelMedium,),
            ),
            Padding(padding: EdgeInsets.all(8),
              child: ElevatedButton(
                child: Text("SnakeBar"),
                style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(color: Colors.red),
                  backgroundColor: Colors.blue,
                ),
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(mensajeS),
                          duration: Duration(seconds: 4),
                          action: SnackBarAction(
                            onPressed: (){
                              ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            },
                            label: "close" ,
                          )
                      ),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(8),
              child: Text(" Otro tipo de 'mensaje' son los conocidos como AlertDialog, la principal diferencia"
                  "que existe entre ellos con lso SnackBars son: que estos generan una nueva ventana"
                  "que se posicionara al frente de nuestra app, dandonos una indicacion o porque no una posible accion a ejecutar ",
              style: Theme.of(context).textTheme.labelLarge,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Text("Encontramos dos tipos principales:",
              style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(//AlertDialog
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                  title: Text("Alerta tipo Android"),
                              content: Text("Ud esta viendo una imagen, una accion o mensaje") ,
                              actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Close"))
                                ],
                              );
                            }
                        );
                      },
                      child: Text("Android"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red
                      ),
                  ),


                  ElevatedButton(//Cupertino AlertDialog --> el proceso es el mismo hasta cupertino
                      onPressed: (){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return CupertinoAlertDialog(
                                title: Text("Alerta Para Iphone"),
                                content: Text("Se muestra un contenido o accion, igual en ambos casos"),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cerrar"),
                                  )
                                ],
                              );
                            }
                        );
                      },
                    child: Text("IOS", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 8,
                        shadowColor: Colors.black
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}