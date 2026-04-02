import 'dart:convert';

import 'package:belajar_flutter/tugas%2015/models/user_model_15.dart';
import 'package:http/http.dart' as http;

class ApiService15 {
  static const String _baseUrl = 'https://absensib1.mobileprojp.com/api';

  static Future<AuthResult15> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/register'),
      headers: {'Accept': 'application/json'},
      body: {
        'name': name.trim(),
        'email': email.trim(),
        'password': password,
      },
    );

    return _parseAuthResult(response);
  }

  static Future<AuthResult15> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Accept': 'application/json'},
      body: {
        'email': email.trim(),
        'password': password,
      },
    );

    return _parseAuthResult(response);
  }

  static Future<UserModel15> getProfile(String token) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final data = _decodeResponse(response);
    final profileMap = data['data'];
    if (profileMap is! Map<String, dynamic>) {
      throw Exception('Data profil tidak valid.');
    }
    return UserModel15.fromJson(profileMap);
  }

  static Future<UserModel15> updateProfile({
    required String token,
    required String name,
    required String email,
  }) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: {
        'name': name.trim(),
        'email': email.trim(),
      },
    );

    final data = _decodeResponse(response);
    final profileMap = data['data'];
    if (profileMap is! Map<String, dynamic>) {
      throw Exception('Respon update profil tidak valid.');
    }
    return UserModel15.fromJson(profileMap);
  }

  static Future<List<UserModel15>> getUsers() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/users'),
      headers: {'Accept': 'application/json'},
    );

    final data = _decodeResponse(response);
    final users = data['data'];
    if (users is! List) {
      throw Exception('Data pengguna tidak valid.');
    }

    return users
        .whereType<Map<String, dynamic>>()
        .map(UserModel15.fromJson)
        .toList();
  }

  static AuthResult15 _parseAuthResult(http.Response response) {
    final data = _decodeResponse(response);
    final message = data['message']?.toString() ?? 'Berhasil';
    final authData = data['data'];

    if (authData is! Map<String, dynamic>) {
      throw Exception('Respon autentikasi tidak valid.');
    }

    final token = authData['token']?.toString();
    final userMap = authData['user'];

    if (token == null || token.isEmpty || userMap is! Map<String, dynamic>) {
      throw Exception('Token atau data user tidak ditemukan.');
    }

    return AuthResult15(
      message: message,
      token: token,
      user: UserModel15.fromJson(userMap),
    );
  }

  static Map<String, dynamic> _decodeResponse(http.Response response) {
    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return body;
    }

    final errors = body['errors'];
    if (errors is Map<String, dynamic> && errors.isNotEmpty) {
      final first = errors.values.first;
      if (first is List && first.isNotEmpty) {
        throw Exception(first.first.toString());
      }
    }

    final message = body['message']?.toString() ?? 'Terjadi kesalahan API.';
    throw Exception(message);
  }
}
