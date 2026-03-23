import 'package:flutter/material.dart';
import 'tela_dois.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Janken Pon'),
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
  void _abrirResultado(String escolhaUsuario) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => TelaDois(escolhaUsuario: escolhaUsuario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text('Janken Pon'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                children: <Widget>[
                  Image.asset('images/padrao.png'),
                  Text(
                    'Escolha do app',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _abrirResultado('pedra'),
                  child: Image.asset('images/pedra.png'),
                ),
                GestureDetector(
                  onTap: () => _abrirResultado('papel'),
                  child: Image.asset('images/papel.png'),
                ),
                GestureDetector(
                  onTap: () => _abrirResultado('tesoura'),
                  child: Image.asset('images/tesoura.png'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
