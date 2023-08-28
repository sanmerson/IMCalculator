import 'package:flutter/material.dart';
import 'package:imcalculator/description.dart';
import 'package:imcalculator/result.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 2, 208, 36)),
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
        titleTextStyle: const TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            description,
            const Padding(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: Text(
                textAlign: TextAlign.center,
                "Calcule o seu IMC aqui!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.black,
                          labelText: 'Altura em Metros',
                        ),
                        controller: minhaAlturaInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite a sua altura!";
                          }
                          if (!value.contains(',') && !value.contains('.')) {
                            return "Adicione . ou ,";
                          }

                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Peso em Kg',
                        ),
                        controller: meuPesoInput,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Digite a seu peso!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(220, 50),
                  backgroundColor: const Color.fromARGB(255, 0, 99, 5),
                ),
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      minhaAltura = double.parse(
                          minhaAlturaInput.text.replaceAll(',', '.'));

                      meuPesoInput.text.contains(',')
                          ? meuPeso = double.parse(
                              meuPesoInput.text.replaceAll(',', '.'))
                          : meuPeso = double.parse(meuPesoInput.text);

                      imc = (meuPeso ~/ (minhaAltura * minhaAltura)).toInt();
                    }
                  });
                },
                child: const Text(
                  'Calcular',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            imc != 0 ? Result(imc: imc.toString()) : Container()
          ],
        ),
      ),
    );
  }
}
