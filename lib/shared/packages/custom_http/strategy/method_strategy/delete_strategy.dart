import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../strategy.dart';

class DeleteRequestStrategy implements ReqMethod {
  @override
  Future<http.Response> execute(String url, Map<String, String> headers,
      {Map<String, dynamic>? body}) {
    return http
        .delete(Uri.parse(url), headers: headers, body: json.encode(body))
        .timeout(
          const Duration(seconds: 60),
          onTimeout: () => throw TimeoutException('Request timed out'),
        );
  }
}
