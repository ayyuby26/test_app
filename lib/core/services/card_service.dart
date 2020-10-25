import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/models/card_model.dart';
import 'package:test_app/core/viewmodel/auth_provider.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CardService {
  static const url = "https://api.kawalcorona.com/indonesia/";
  static var random = Random();

  static void getCard(BuildContext context) async {
    final auth = Provider.of<AuthProvider>(context);
    try {
      var response = await http.get(url);
      var status = response.statusCode;
      var result = json.decode(response.body);
      if (status == 200) {
        Map<String, dynamic> _r = (result as List)[0];
        auth.setCard(CardModel.fromjson(_r));
      }
    } catch (e) {
      Get.snackbar("Kesalahan", e.toString());
    }
  }
}
