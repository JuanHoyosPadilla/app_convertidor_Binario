// ignore_for_file: avoid_print

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

String decimalToBinary(int decimalNumber){
  return decimalNumber.toRadixString(2);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(209, 149, 181, 224)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CanBin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _numero = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(107, 124, 139, 175),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ))
          ],
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'Convertidor a Binario',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 67, 144, 199)),
              ),
               const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                child: TextField(
                  decoration:  InputDecoration(
                      hintText: 'Ingresa el numero',
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )
                      
                      ),
                      
                  
                  controller: _numero,
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: (){
                    try {
                      int number = int.parse(_numero.text);
                    String binary = decimalToBinary(number);
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: const Text('Datos convertidos a Binario'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('El numero: $number', style: const TextStyle(color: Colors.white,fontSize: 20.0),),
                            Text('Binario: $binary', style: const TextStyle(color: Colors.grey, fontSize: 25.0,fontWeight: FontWeight.normal),)
        
                          ],
                        ),
                        actions: [
                           IconButton(onPressed: (){
                            Navigator.of(context).pop();
                           }, icon: const Icon(Icons.close))
                        ],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.black,
                        elevation: 8.0,
                        titleTextStyle: const TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      );

                    });
                    _numero.clear();
                      
                    } catch (e) {
                      return print(e);
                    }
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(5.0), // Bordes redondeados
                      )),
                  child: const SizedBox(
                      width: 100, child: Center(child: Text('Convertir'))))
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
