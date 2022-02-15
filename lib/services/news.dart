import 'dart:convert';

import 'package:covid_app/models/news_model.dart';
import 'package:covid_app/services/api.dart';
import 'package:http/http.dart' as http;

Future<List<News>> getDataNews() async {
  final response = await http.get(
    Uri.parse(newsApi),
  );

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load Data');
  }
}
