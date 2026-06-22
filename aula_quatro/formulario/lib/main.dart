import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tela_dois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atividade 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 133, 143, 249),
        ),
      ),
      home: const MyHomePage(title: 'Cadastro de Usuario'),
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
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _generoSelecionado;
  bool _checkboxMarcado = false;

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Preencha os campos abaixo:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 300,
              child: TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Nome',
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 300,
              child: TextField(
                controller: _idadeController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Idade',
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 300,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'E-mail',
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              width: 300,
              child: DropdownButtonFormField<String>(
                value: _generoSelecionado,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Gênero',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                items: <String>['Masculino', 'Feminino', 'Outro'].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }).toList(),
                onChanged: (String? novoValor) {
                  setState(() {
                    _generoSelecionado = novoValor;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _checkboxMarcado,
                  onChanged: (bool? valor) {
                    setState(() {
                      _checkboxMarcado = valor ?? false;
                    });
                  },
                ),
                const Text(
                  'Concordo com os termos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                final nome = _nomeController.text.trim();
                final idade = _idadeController.text.trim();
                final email = _emailController.text.trim();
                final emailValido = RegExp(
                  r'^[\w\.-]+@[\w\.-]+\.[a-zA-Z]{2,}$',
                ).hasMatch(email);

                if (nome.isEmpty ||
                    idade.isEmpty ||
                    email.isEmpty ||
                    _generoSelecionado == null ||
                    !_checkboxMarcado) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Preencha todos os campos e concorde com os termos.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                  return;
                }

                if (!emailValido) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'O e-mail deve seguir o padrão email@provedor.com.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                  return;
                }

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TelaDois(
                      nome: nome,
                      idade: idade,
                      email: email,
                      genero: _generoSelecionado!,
                    ),
                  ),
                );
              },
              child: const Text(
                'Cadastrar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
