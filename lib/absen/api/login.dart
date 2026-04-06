import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/absen/models/login_model.dart';
import 'package:ppkd_b_5/day_16_17_18/database/preference.dart';
import 'package:ppkd_b_5/day_30/api/endpoint.dart';

Future<LoginModel?> loginUser({
  required String email,
  required String password,
}) async {
  final response = await http.post(
    Uri.parse(Endpoint.login),
    headers: {"Accept": "application/json"},
    body: {"email": email, "password": password},
  );

  log(response.body);

  if (response.statusCode == 200) {
    final data = LoginModel.fromJson(json.decode(response.body));

    /// Ambil token
    final token = data.data?.token;

    if (token != null) {
      /// Simpan token
      await PreferenceHandler().storingToken(token);

      /// Simpan status login
      await PreferenceHandler().storingIsLogin(true);
    }

    return data;
  } else {
    final error = LoginModel.fromJson(json.decode(response.body));

    throw Exception(error.message);
  }
}
