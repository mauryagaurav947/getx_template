import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

/// Extension for response
extension ResponseExtension on Response {
  /// Checks if the request was success or not
  bool get isSuccess => statusCode == HttpStatus.ok;

  /// Decodes the response body and returns
  /// Map<String, dynamic>?
  dynamic get decode => json.decode(body) as Map<String, dynamic>;
}
