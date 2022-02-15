import 'dart:convert';

import 'package:covid_app/models/status.dart';
import 'package:covid_app/services/api.dart';
import 'package:http/http.dart' as http;

Future<StatusCovid> getDataCovid() async {
  final response = await http.get(
    Uri.parse(statusApi),
  );

  if (response.statusCode == 200) {
    return StatusCovid.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}

Future<Region> getDataRegion() async {
  final response = await http.get(
    Uri.parse(statusApi),
  );

  if (response.statusCode == 200) {
    return Region.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Data');
  }
}
