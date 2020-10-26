import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:test_app/core/models/auth_model.dart';
import 'package:test_app/core/viewmodel/auth_provider.dart';

class AuthService {
  static const url = "http://192.168.73.114/api/api/user";

  static void  authLogin(
    String email,
    String password,
    BuildContext context,
  ) async {
    final auth = Provider.of<AuthProvider>(context);
    try {
      var response = await http.put(url,
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
          headers: {"Content-type": "application/json"});

      var status = response.statusCode;
      var result = json.decode(response.body);
      if (status == 409)
        Get.snackbar("Kesalahan", result['message']);
      else if (status == 200) {
        Map<String, dynamic> _r = (result as List)[0];
        auth.setUser(AuthModel.fromJson(_r));
        // CoronaService.getCard(context);
        Get.offAllNamed('/dashboard');
      }
    } catch (e) {
      Get.snackbar("Kesalahan", e.toString());
    }
  }

  Future<int> authRegister(String email, String password, String fullname,
      BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context);
    try {
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
        "fullname": fullname,
      });

      var result = json.decode(response.body)['message'];
      if (response.statusCode == 409) {
        Get.snackbar("Kesalahan", result);
        return response.statusCode;
      } else if (response.statusCode == 200) {
        auth.setEmail(email);
        auth.setPass(password);
        Get.offNamed('/');
        Get.snackbar("Selamat", result);
      }
    } catch (e) {
      Get.snackbar("Kesalahan", e.toString());
    }
  }
}
