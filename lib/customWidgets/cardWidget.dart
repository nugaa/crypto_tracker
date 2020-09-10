import 'package:flutter/material.dart';

Padding meuCard(
    {@required String crypto,
    @required int valorConvertido,
    @required String moedaConvertida}) {
  if (moedaConvertida == null) {
    moedaConvertida = 'AUD';
  }

  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 5.0),
    child: Card(
      elevation: 5.0,
      shadowColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          valorConvertido == null
              ? '1 $crypto = ? $moedaConvertida'
              : '1 $crypto = $valorConvertido $moedaConvertida',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
