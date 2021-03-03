import 'package:bitcoin_tracker/servicos/networking.dart';

const kApiKey = '*****************';
const kUrl = 'https://rest.coinapi.io/v1/exchangerate';

class DadosMoeda {
  Future<dynamic> getDadosConverterBTC(String moedaConvertida) async {
    var url = '$kUrl/BTC/$moedaConvertida?apikey=$kApiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var moedaDados = await networkHelper.getDados();
    print(url);
    return moedaDados;
  }

  Future<dynamic> getDadosConverterETH(String moedaConvertida) async {
    var url = '$kUrl/ETH/$moedaConvertida?apikey=$kApiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var moedaDados = await networkHelper.getDados();
    return moedaDados;
  }

  Future<dynamic> getDadosConverterLTC(String moedaConvertida) async {
    var url = '$kUrl/LTC/$moedaConvertida?apikey=$kApiKey';
    NetworkHelper networkHelper = NetworkHelper(url);
    var moedaDados = await networkHelper.getDados();
    return moedaDados;
  }
}
