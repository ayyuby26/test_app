import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/models/corona_model.dart';
import 'package:test_app/core/viewmodel/corona_provider.dart';

class CoronaService {
  // static const url = "https://data.covid19.go.id/public/api/prov.json";
  static const url = "https://data.covid19.go.id/public/api/update.json";

  static Future<void> getCard(BuildContext context) async {
    final crn = Provider.of<CoronaProvider>(context);
    try {
      var response = await http.get(url);
      var status = response.statusCode;
      var result = json.decode(response.body);
      if (status == 200) {
        crn.setCoronaType(result, CoronaType.penambahan);
        crn.setCoronaType(result, CoronaType.total);
      }
    } catch (e) {
      Get.snackbar("Kesalahan", e.toString());
    }
  }
}
