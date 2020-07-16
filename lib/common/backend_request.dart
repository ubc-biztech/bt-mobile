import 'dart:convert';

import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

enum FetcherMethod { get, post }

/// A simplified [Error] class to keep our code robust and easier to read.
class BadResponseError extends Error {
  BadResponseError({@required this.status, @required this.message});

  final int status;
  final http.Response message;
}

class Fetcher {
  /// Gets the STAGING_API key from our .env file and saves it to [_apiUrl].
  Fetcher() : _apiUrl = DotEnv().env['STAGING_API'];

  final String _apiUrl;

  /// This is basically the same as the web app's logic.
  ///
  /// The dynamic type [K] is the response body type. If we're expecting a JSON,
  /// we want it as a Map<String, dynamic>. The method call will look like:
  ///       Fetcher().fetchBackend<Map<String, dynamic>>()
  Future<K> fetchBackend<K>(String endpoint, FetcherMethod method,
      {dynamic data}) async {
    final AuthenticationManager authManager = GetIt.I<AuthenticationManager>();
    final String jwtToken = await authManager.jwtToken;
    final Map<String, String> headers = {'Authorization': 'Bearer $jwtToken'};
    http.Response response;
    switch (method) {
      case FetcherMethod.get:
        response = await http.get('$_apiUrl$endpoint', headers: headers);
        break;
      case FetcherMethod.post:
        headers['Accept'] = 'application/json';
        headers['Content-Type'] = 'application/json';
        final body = const JsonEncoder().convert(data);
        response =
            await http.post('$_apiUrl$endpoint', headers: headers, body: body);
        break;
    }
    final int status = response.statusCode;
    if (status < 200 || status >= 300) {
      throw BadResponseError(status: status, message: response);
    }
    return json.decode(response.body).cast<K>();
  }
}
