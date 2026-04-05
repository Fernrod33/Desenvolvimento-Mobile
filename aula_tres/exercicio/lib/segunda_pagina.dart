import 'package:flutter/material.dart';

class SegundaPagina extends StatelessWidget {
  final String nome;
  const SegundaPagina({super.key, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segunda Página')),
      body: Center(
        child: Text(
          'Bem-vindo à Segunda Página! $nome',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
