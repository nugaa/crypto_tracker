import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  var decodedDados;
  void getDados() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String dados = response.body;
      decodedDados = jsonDecode(dados);
      return decodedDados;
    } else {
      print(response.statusCode);
    }
  }
}
