import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Appiadas', home: AppiadasHome());
  }
}

class Piada {
  final String pergunta;
  final String resposta;

  Piada({required this.pergunta, required this.resposta});
}

class AppiadasHome extends StatefulWidget {
  const AppiadasHome({super.key});

  @override
  State<AppiadasHome> createState() => _AppiadasHomeState();
}

class _AppiadasHomeState extends State<AppiadasHome> {
  final List<Piada> _piadas = [
    Piada(pergunta: "pergunta", resposta: "resposta"),
    Piada(pergunta: "pergunta 2", resposta: "resposta 2"),
    Piada(pergunta: "pergunta 3", resposta: "resposta 3"),
  ];

  Piada _piadaSelecionada = Piada(pergunta: 'pergunta', resposta: 'resposta');

  void trocarPiada() {
    setState(() {
      var indice = Random().nextInt(_piadas.length);
      _piadaSelecionada = _piadas[indice];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("Appiadas")),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background_joker.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "${_piadaSelecionada.pergunta}\n\n${_piadaSelecionada.resposta}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
            ),

            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                ),
                onPressed: trocarPiada,
                child: Text("Nova piada"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
