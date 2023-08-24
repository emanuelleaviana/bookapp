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
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var url = Uri.parse(baseURL + api);
    var response = await client.post(url, body: payload, headers: headers);
    if (response.statusCode == 201) {
      return response.body;
    } else {
      return null;
    }
  }

  // PUT
  Future<dynamic> put(String api, dynamic object) async {
    var url = Uri.parse(baseURL + api);
    var payload = json.encode(object);
    var headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var client = http.Client();

    var response = await client.put(url, body: payload, headers: headers);
    if (response.statusCode == 204) {
      return response.body;
    } else {
      return null;
    }
  }

  // DELETE
  Future<dynamic> delete(String api) async {
    var client = http.Client();
    var headers = {
      'Authorization': 'Bearer sfie328370428387=',
      'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var url = Uri.parse(baseURL + api);
    var response = await client.delete(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
