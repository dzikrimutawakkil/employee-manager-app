import 'custom_http.dart';

abstract class MyCustomHttpRequest with HttpResponseHandlerMixin {
  Future<ApiResponse> sendRequest({
    required String url,
    String? token,
    Map<String, dynamic> body = const {},
    required ReqMethod method,
    Map<String, String> headers = const {},
  }) async {
    final ApiResponse apiResponse = ApiResponse();

    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final Map<String, String> finalHeaders = {
      ...defaultHeaders,
      ...headers,
    };

    final context = HttpRequestContext(method);

    try {
      final response = await context.execute(url, finalHeaders, body: body);
      handleResponse(apiResponse, response);
    } catch (error) {
      handleError(error.toString(), null);
    }

    return apiResponse;
  }
}
