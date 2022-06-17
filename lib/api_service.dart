import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutterapp/env.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static String baseUrl =API_URL;

  static get(String rota) async {
    var response = await http.get(Uri.parse("${ApiService.baseUrl}$rota"));
    return Utf8Decoder().convert(response.bodyBytes);
  }

  static post(String rota, data) async {
    var response = await http.post(Uri.parse("${ApiService.baseUrl}$rota"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: data);

    return response;
  }

  static put(String rota, data) async {
    var response = await http.put(Uri.parse("${ApiService.baseUrl}$rota"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: data);

    return response;
  }

  static delete(String rota, data) async {
    var response = await http.delete(Uri.parse("${ApiService.baseUrl}$rota"),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: data);
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
    return response;
  }
}