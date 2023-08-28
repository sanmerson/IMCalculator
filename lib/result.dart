import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String imc;
  const Result({super.key, required this.imc});

  @override
  State<StatefulWidget> createState() => _ResultPage();
}

class _ResultPage extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Text(
            "Seu IMC é: ${widget.imc}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Text(
            "Verifique abaixo a sua classificação",
            style: TextStyle(fontSize: 14),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Table(
            border: TableBorder(
              horizontalInside: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              verticalInside: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              top: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              left: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              right: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              bottom: const BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            children: [
              _titleTable("Classificação , IMC"),
              _linhaTable(
                  "Magreza , Menor que 18 ", int.parse(widget.imc) < 18),
              _linhaTable("Normal , Entre 18 e 25",
                  int.parse(widget.imc) >= 18 && int.parse(widget.imc) < 25),
              _linhaTable("Sobrepeso, Entre 25 e 30",
                  int.parse(widget.imc) >= 25 && int.parse(widget.imc) < 30),
              _linhaTable("Obesidade, Acima de 30", int.parse(widget.imc) > 30)
            ],
          ),
        ),
      ],
    );
  }

  _titleTable(String listaNomes) {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        );
      }).toList(),
    );
  }
}

_linhaTable(String listaNomes, bool isImc) {
  if (isImc) {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.lightGreen),
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
        );
      }).toList(),
    );
  } else {
    return TableRow(
      children: listaNomes.split(',').map((name) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: const TextStyle(fontSize: 14.0),
          ),
        );
      }).toList(),
    );
  }
}
