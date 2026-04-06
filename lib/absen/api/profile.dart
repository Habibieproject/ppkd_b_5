import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/absen/models/profile_model.dart';
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_30/api/endpoint.dart';

Future<ProfileModel?> getProfile() async {
  final token = await PreferenceHandler.getToken();

  final response = await http.get(
    Uri.parse("${Endpoint.baseUrl}/profile"),
    headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
  );

  log(response.body);

  if (response.statusCode == 200) {
    return ProfileModel.fromJson(json.decode(response.body));
  } else {
    throw Exception("Gagal mengambil profile");
  }
}
