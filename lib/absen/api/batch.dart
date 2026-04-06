import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkd_b_5/day_30/api/endpoint.dart';

Future<List> getBatches() async {
  final response = await http.get(
    Uri.parse("${Endpoint.baseUrl}/batches"),
    headers: {"Accept": "application/json"},
  );

  final data = json.decode(response.body);

  return data["data"];
}
