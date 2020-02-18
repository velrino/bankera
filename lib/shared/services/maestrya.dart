import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MaestryaService {
  Future<dynamic> getPage(String pageName) async {
    String apiUrl =
        'https://protected-ridge-35353.herokuapp.com/api/pages/${pageName}';
    http.Response response = await http.get(apiUrl);
    return json.decode(response.body);
  }
}
