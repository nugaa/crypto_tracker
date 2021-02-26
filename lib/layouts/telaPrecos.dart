import 'package:bitcoin_tracker/constantes.dart';
import 'package:bitcoin_tracker/customWidgets/cardWidget.dart';
import 'package:bitcoin_tracker/servicos/dados_moedas.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaPrecos extends StatefulWidget {
  @override
  _TelaPrecosState createState() => _TelaPrecosState();
}

class _TelaPrecosState extends State<TelaPrecos> {
  int racioIntBTC, racioIntETH, racioIntLTC;
  String moedaSelecionada;
  String moedaConverter;
  var dadosBTC, dadosETH, dadosLTC;
  DadosMoeda dadosMoeda = DadosMoeda();

  List<Widget> getLista() {
    List<Widget> lista = [];
    for (String moeda in listaMoedas) {
      lista.add(
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pinkAccent.withOpacity(0.6),
          ),
          child: Center(
            child: Text(
              moeda,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }
    return lista;
  }

  void updateUI(dynamic obterDadosBTC, obterDadosETH, obterDadosLTC) {
    setState(() {
      double racioDeBTC = obterDadosBTC['rate'];
      racioIntBTC = racioDeBTC.toInt();
      double racioDeETH = obterDadosETH['rate'];
      racioIntETH = racioDeETH.toInt();
      double racioDeLTC = obterDadosLTC['rate'];
      racioIntLTC = racioDeLTC.toInt();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              meuCard(
                  crypto: listaCrypto[0],
                  valorConvertido: racioIntBTC,
                  moedaConvertida: moedaConverter),
              meuCard(
                  crypto: listaCrypto[1],
                  valorConvertido: racioIntETH,
                  moedaConvertida: moedaConverter),
              meuCard(
                  crypto: listaCrypto[2],
                  valorConvertido: racioIntLTC,
                  moedaConvertida: moedaConverter),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFE91C63),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                height: 140.0,
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListWheelScrollView(
                    itemExtent: 32.0,
                    children: getLista(),
                    diameterRatio: 1.0,
                    onSelectedItemChanged: (valorSelecionado) async {
                      moedaConverter = listaMoedas[valorSelecionado];
                      dadosBTC =
                          await dadosMoeda.getDadosConverterBTC(moedaConverter);
                      dadosETH =
                          await dadosMoeda.getDadosConverterETH(moedaConverter);
                      dadosLTC =
                          await dadosMoeda.getDadosConverterLTC(moedaConverter);

                      setState(() {
                        updateUI(dadosBTC, dadosETH, dadosLTC);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
