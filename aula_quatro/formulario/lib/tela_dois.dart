import 'package:flutter/material.dart';

class TelaDois extends StatelessWidget {
  final String nome;
  final String idade;
  final String email;
  final String genero;

  const TelaDois({
    super.key,
    required this.nome,
    required this.idade,
    required this.email,
    required this.genero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Confirmação de Cadastro',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Dados informados abaixo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Nome: $nome',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Idade: $idade',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'E-mail: $email',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black26),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Gênero: $genero',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Cadastro confirmado com sucesso!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );

                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                'Confirmar cadastro',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
