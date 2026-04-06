import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_30/api/endpoint.dart';

Future<void> updateProfile({required String name}) async {
  final token = await PreferenceHandler.getToken();

  final response = await http.put(
    Uri.parse("${Endpoint.baseUrl}/profile"),
    headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    body: {"name": name},
  );

  log(response.body);

  final data = json.decode(response.body);

  if (response.statusCode == 200) {
    return;
  } else {
    throw Exception(data["message"]);
  }
}
