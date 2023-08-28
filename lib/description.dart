import 'package:flutter/material.dart';

Widget description = const Row(
  children: [
    Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Text(
            "O que é IMC?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Text(
            "IMC é a sigla de Índice de Massa Corporal, um parâmetro que é utilizado para avaliar se o peso está dentro do valor ideal para a altura. ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Text(
            "Isso significa que, a partir do resultado do IMC é possível saber se a pessoa está acima ou abaixo do peso recomendado e também diagnosticar problemas de saúde como obesidade ou desnutrição.",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: Text(
            "O IMC pode ser utilizado em crianças, adolescentes, adultos ou idosos. ",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    ))
  ],
);
