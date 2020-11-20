import 'package:http/http.dart' as Http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;
  Future getData() async {
    Http.Response response = await Http.get(url+'?apiKey=97709AC1-FE2A-4F4C-83F0-44E52B051DC3');
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}