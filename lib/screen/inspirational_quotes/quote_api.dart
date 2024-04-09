import 'dart:convert';
import 'package:tranquil_mind/screen/inspirational_quotes/quotes_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const String baseUrl = "https://zenquotes.io/api/";

  static Future<quotes_model> fetchRandomQuote() async {
    final response = await http.get(Uri.parse("${baseUrl}random"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return quotes_model.fromJson(data[0]);
    } else {
      throw Exception("Failed to generate quote");
    }
  }
}