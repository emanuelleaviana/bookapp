import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseURL = "https://book-api-alpha.azurewebsites.net/api";

class BookRepository {
  // GET
  Future<dynamic> get(String api) async {
    var client = http.Client();
    var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var url = Uri.parse(baseURL + api);
    var response = await client.get(url, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  // POST
  Future<dynamic> post(String api, dynamic object) async {
    var client = http.Client();
    var _payload = json.encode(object);
var _headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var url = Uri.parse(baseURL + api);
    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // PUT
  Future<dynamic> put(String api) async {
    // Implementar lógica do método PUT aqui
  }

  // DELETE
  Future<dynamic> delete(String api) async {
    // Implementar lógica do método DELETE aqui
  }
}