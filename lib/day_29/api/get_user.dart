import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/day_29/models/user_models.dart';

Future<List<GetUserData>> getUser() async {
  final response = await http.get(
    Uri.parse("https://reqres.in/api/users?page=2"),
    headers: {
      "x-api-key":
          "pro_5723ae342dcc2a529e67d531edc4eb99ef6c8cfdc86a49ecead23ea7e734cec3",
    },
  );

  log(response.body);
  if (response.statusCode == 200) {
    final List<dynamic> userJson = json.decode(response.body)["data"];
    return userJson.map((json) => GetUserData.fromJson(json)).toList();
  } else {
    throw Exception("Gagal memuat data");
  }
}
