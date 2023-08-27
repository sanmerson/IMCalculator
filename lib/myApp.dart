import 'package:flutter/material.dart';
import 'package:imcalculator/description.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 2, 208, 36)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'IMCalculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final minhaAlturaInput = TextEditingController();
  final meuPesoInput = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int imc = 0;
  double minhaAltura = 0.00;
  double meuPeso = 0.00;
  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            description,
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                "Calcule o seu IMC aqui!",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              key: _formKey,
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                ),
                controller: minhaAlturaInput,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso',
                ),
                controller: meuPesoInput,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                fixedSize: const Size(220, 20),
                backgroundColor: const Color.fromARGB(255, 0, 99, 5),
              ),
              onPressed: () {
                setState(() {
                  imc = (double.parse(meuPesoInput.text) ~/
                          (double.parse(minhaAlturaInput.text) *
                              double.parse(minhaAlturaInput.text)))
                      .toInt();
                });
              },
              child: const Text(
                'Calcular',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
            ),
            Text('$imc')
          ],
        ),
      ),
    );
  }
}
