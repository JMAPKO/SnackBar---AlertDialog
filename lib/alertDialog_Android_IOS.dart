// A diferencia de los SnakBar, el AlertDialog nos muestra un mensaje que sale sobre la pantalla
// Ademas este puede ejecutar otras acciones, hay dos tipos el normal (Android) y el Cupertino(IOS)


import 'package:flutter/cupertino.dart';
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
      home: _HomePage(title: "App - AlertDialog"),
    );
  }
}

class _HomePage extends StatelessWidget{
  final String? title;
  const _HomePage({Key? key, required this.title}):super(key: key);


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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text("Titulo: AlertAndriod"),
                          content: Text("Este es el contenido del AlertDialog"),
                          actions: [
                            TextButton(
                                onPressed: (){Navigator.of(context).pop();},
                                child: Text("cerrar"))
                          ],

                        );
                      }
                  );} ,
                child: Text("Mostrar AlertDialog"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white))
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return CupertinoAlertDialog(
                          title: Text("Titulo: AlertaIOS"),
                          content: Text("Contenido de la alerta"),
                          actions: [
                            TextButton(
                                onPressed: (){Navigator.of(context).pop();},
                                child: Text("close"))
                          ],
                        );
                      }
                  );
                },
                child: Text("Mostrar CupertinoAlertDialog"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white)
                  )
                )
              )
          ]
        ),
      ),
    );
  }


}