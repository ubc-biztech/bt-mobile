import 'package:bt_mobile/common/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

enum FetcherMethod { get, post }

class BadResponseError extends Error {
  BadResponseError({@required this.status, @required this.message});

  final int status;
  final http.Response message;
}

class Fetcher {
  Fetcher() : _apiUrl = DotEnv().env['STAGING_API'];

  final String _apiUrl;

  Future<dynamic> fetchBackend(String endpoint, FetcherMethod method,
      {dynamic data}) async {
    final AuthenticationManager authManager = GetIt.I<AuthenticationManager>();
    final String jwtToken = await authManager.jwtToken;
    final Map<String, String> headers = {'Authorization': 'Bearer $jwtToken'};
    if (method == FetcherMethod.post) {
      headers['Accept'] = 'application/json';
      headers['Content-Type'] = 'application/json';
    }
    switch (method) {
      case FetcherMethod.get:
        final http.Response response =
            await http.get('$_apiUrl$endpoint', headers: headers);
        final int status = response.statusCode;
        if (status < 200 || status >= 300) {
          throw BadResponseError(status: status, message: response);
        }
        return response;
      case FetcherMethod.post:
//        final body = const JsonEncoder().convert(data);
        break;
    }
  }
}
