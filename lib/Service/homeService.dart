import 'package:flutter/material.dart';
import 'package:hasnaoui/data/server.dart';

import 'general.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeService {
  static Future<General<int>> getMatiere(String matiereNom) async {
    try {
      http.Response response = await http.get(Uri.parse(urlMaterie + matiereNom),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return General<int>(data: jsonData);
      }
      return General<int>(error: true);
    } on Exception catch (e) {
      return General<int>(error: true);
    }
  }
}
