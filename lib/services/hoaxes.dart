import 'dart:convert';

import 'package:covid_app/models/hoaxes_model.dart';
import 'package:covid_app/services/api.dart';
import 'package:http/http.dart' as http;

Future<List<Hoaxes>> getDataHoaxes() async {
  final response = await http.get(
    Uri.parse(hoaxApi),
  );

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Hoaxes>((json) => Hoaxes.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Data');
  }
}
