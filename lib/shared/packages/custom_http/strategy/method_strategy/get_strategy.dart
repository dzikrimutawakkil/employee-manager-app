import 'dart:async';
import 'package:http/http.dart' as http;
import '../strategy.dart';

class GetRequestStrategy implements ReqMethod {
  @override
  Future<http.Response> execute(String url, Map<String, String> headers,
      {Map<String, dynamic>? body}) {
    return http.get(Uri.parse(url), headers: headers).timeout(
          const Duration(seconds: 60),
          onTimeout: () => throw TimeoutException('Request timed out'),
        );
  }
}
