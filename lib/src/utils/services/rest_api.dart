import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:getx_template/src/config/api_path.dart';
import 'package:getx_template/src/models/models.dart';
import 'package:getx_template/src/utils/extensions/response_extension.dart';
import 'package:getx_template/src/utils/interceptors/interceptors.dart';

class Services {
  Services._();

  /// Create instance of HttpClient
  // static final HttpClient _httpClient = HttpClient();
  static final Client _client = InterceptedClient.build(
    interceptors: [
      AppInterceptor(),
    ],
    requestTimeout: const Duration(seconds: 5),
  );

  ///
  static Uri _uri(
    String authority,
    String unencodedPath, [
    Map<String, dynamic>? queryParameters,
  ]) =>
      Uri.https(authority, unencodedPath, queryParameters);

  //
  static Future<Data> signIn(Map<String, dynamic> body) async {
    final Uri url = _uri(Urls.baseUrl, Urls.signIn);
    try {
      final Response response =
          await _client.post(url, body: json.encode(body));
      final jsonResponse = response.decode;
      if (response.isSuccess) {
        return Data.fromResponse(response).copyWith(data: jsonResponse);
      }
      return Data.error(message: 'Invalid credential');
    } catch (exception) {
      return Data.fromException(exception);
    }
  }
}
