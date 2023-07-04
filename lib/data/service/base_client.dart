import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as html;

const TIME_OUT_DURATION = 30;

class BaseClient {
  static final client = html.Client();
  static Map<String, String> _headers = {
    "Accept": "application/vnd.github+json",
    "X-GitHub-Api-Version": "2022-11-28"
  };

  void setHeaderAuth(String token) {
    _headers = {..._headers, "Authorization": "Bearer $token"};
  }

  Future<dynamic> get(String baseUrl, String api,
      {Map<String, String>? additionHeader}) async {
    try {
      var uri = Uri.parse(baseUrl + api);

      var response = await client.get(uri, headers: {
        ..._headers,
        ...additionHeader ?? {}
      }).timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<dynamic> post(String baseUrl, String api,
      {Map<String, String>? additionHeader, Object? body}) async {
    try {
      var uri = Uri.parse(baseUrl + api);

      var response = await client
          .post(
            uri,
            headers: {
              ..._headers,
              ...additionHeader ?? {},
            },
            body: json.encode(body),
          )
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
