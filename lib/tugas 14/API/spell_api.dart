import 'dart:convert';
import 'dart:developer';
import 'package:belajar_flutter/tugas%2014/models/models_14.dart';
import 'package:http/http.dart' as http;

Future<List<Karakter>> getSpells() async {
  final response = await http.get(Uri.parse("https://hp-api.onrender.com/api/characters"));

  if (response.statusCode == 200) {
    return welcomeFromJson(response.body);
  } else {
    log("Failed to load data: ${response.statusCode}");
    throw Exception("Failed to load data");
  }
}