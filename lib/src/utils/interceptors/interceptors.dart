import 'dart:io';

import 'package:getx_template/src/utils/extensions/log_extension.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AppInterceptor implements InterceptorContract {
  final bool logRequests;
  final bool logResponse;

  AppInterceptor({this.logRequests = true, this.logResponse = true});

  /// Rest apis header with token
  /// if token is not stored then send token as `1`
  static Map<String, String> get _restApiHeaders => <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: "Bearer 1234567",
      };

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    data.headers.addAll(_restApiHeaders);
    if (logRequests) {
      final baseRequest = data.toHttpRequest();
      final method = baseRequest.method;
      final url = baseRequest.url.toString();
      final headers = baseRequest.headers;
      var curl = '';
      curl += 'curl';
      curl += ' -v';
      curl += ' -X $method';
      headers.forEach((k, v) {
        curl += " -H '$k: $v'";
      });
      // this is fairly naive, but it should cover most cases
      final body = baseRequest.body;
      if (body.isNotEmpty) {
        curl += " -d '$body'";
      }
      curl += ' "$url"';

      curl.log();
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (logResponse) {
      "Response - ${data.body}".log();
    }
    return data;
  }
}
