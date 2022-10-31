import 'package:hasnaoui/Model/model.user.dart';
import 'package:hasnaoui/data/server.dart';

import 'general.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static Future<General<UserModel>> logIn(String userName, String password) async {
    var body = {
      'username':userName,
      'password':password,
    };
    try {
      http.Response response =
      await http.post(Uri.parse(urlLogin),headers: {
        "Content-Type": "application/json"
      }, body: jsonEncode(body));
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance(); // cache
        var jsonData = jsonDecode(response.body);
        UserModel user = UserModel.fromJson(jsonData);
        preferences.setString('user', response.body);
        preferences.setString('token', user.token);
        return General<UserModel>(data: user);
      }
      return General<UserModel>(error: true);
    } on Exception catch (e) {
      return General<UserModel>(error: true,);
    }
  }
}

