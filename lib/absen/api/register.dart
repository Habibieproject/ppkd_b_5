import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/day_30/api/endpoint.dart';

Future<void> registerUser({
  required String name,
  required String email,
  required String password,
  required String jenisKelamin,
  required int batchId,
  required int trainingId,
}) async {
  final response = await http.post(
    Uri.parse(Endpoint.register),
    headers: {"Accept": "application/json"},
    body: {
      "name": name,
      "email": email,
      "password": password,
      "jenis_kelamin": jenisKelamin,
      "profile_photo": "",
      "batch_id": batchId.toString(),
      "training_id": trainingId.toString(),
    },
  );

  log(response.body);

  final data = json.decode(response.body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    return;
  } else {
    throw Exception(data["message"]);
  }
}
