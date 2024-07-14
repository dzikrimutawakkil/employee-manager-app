import 'package:http/http.dart' as http;
import 'strategy.dart';

abstract class ReqMethod {
  Future<http.Response> execute(String url, Map<String, String> headers,
      {Map<String, dynamic>? body});

  static final ReqMethod getMethod = GetRequestStrategy();
  static final ReqMethod deleteMethod = DeleteRequestStrategy();
  static final ReqMethod patchMethod = PatchRequestStrategy();
  static final ReqMethod postMethod = PostRequestStrategy();
  static final ReqMethod putMethod = PutRequestStrategy();
}
