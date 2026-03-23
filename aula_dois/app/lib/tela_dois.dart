import 'package:flutter/material.dart';
import 'dart:math';

class TelaDois extends StatelessWidget {
  const TelaDois({super.key, required this.escolhaUsuario});

  final String escolhaUsuario;

  String _sortearEscolhaApp() {
    final opcoes = <String>['pedra', 'papel', 'tesoura'];
    final indice = Random().nextInt(opcoes.length);
    return opcoes[indice];
  }

  String _definirResultado(String usuario, String app) {
    if (usuario == app) {
      return 'Empate!';
    }

    final usuarioVenceu =
        (usuario == 'pedra' && app == 'tesoura') ||
        (usuario == 'papel' && app == 'pedra') ||
        (usuario == 'tesoura' && app == 'papel');

    return usuarioVenceu ? 'Voce venceu!' : 'Voce perdeu!';
  }

  String _imagemDaEscolha(String escolha) {
    return 'images/$escolha.png';
  }

  String _iconeDoResultado(String resultado) {
    if (resultado == 'Empate!') {
      return 'images/icons8-aperto-de-maos-100.png';
    }

    if (resultado == 'Voce venceu!') {
      return 'images/icons8-vitoria-48.png';
    }

    return 'images/icons8-perder-48.png';
  }

  @override
  Widget build(BuildContext context) {
    final escolhaApp = _sortearEscolhaApp();
    final resultado = _definirResultado(escolhaUsuario, escolhaApp);

    return Scaffold(
      appBar: AppBar(title: const Text('Janken Pon'), backgroundColor: Color.fromARGB(255, 255, 0, 0),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Escolha do app',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Image.asset(_imagemDaEscolha(escolhaApp), height: 120),
            const SizedBox(height: 24),
            const Text(
              'Sua escolha',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Image.asset(_imagemDaEscolha(escolhaUsuario), height: 120),
            const SizedBox(height: 24),
            Text(
              resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            Image.asset(_iconeDoResultado(resultado), height: 180),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Jogar novamente',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
