import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_app/core/models/corona_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class CoronaTotalService {
  // static const url = "https://data.covid19.go.id/public/api/prov.json";
  static const url = "https://data.covid19.go.id/public/api/update.json";

  static Future<CoronaModel> getCard(BuildContext context) async {
    try {
      var response = await http.get(url);
      var status = response.statusCode;
      var result = json.decode(response.body);
      if (status == 200) {
        final Map<String, dynamic> crn = (result as Map<String, dynamic>)['update']['total'] as Map<String, dynamic>;
        return CoronaModel.fromjson(crn);
      }
    } catch (e) {
      Get.snackbar("Kesalahan", e.toString());
    }
  }
}
