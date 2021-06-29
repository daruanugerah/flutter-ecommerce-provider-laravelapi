import 'dart:convert';

import 'package:bwa_ecom_prov/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://shamo-backend.buildwithangga.id/api';

  Future<UserModel> register(
      {String name, String username, String email, String password}) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode(
      {
        'name': name,
        'username': username,
        'email': email,
        'password': password,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel userModel = UserModel.fromJson(data['user']);
      userModel.token = data['token_type'] + " " + data['access_token'];

      return userModel;
    } else {
      throw Exception('Gagal register');
    }
  }
}
