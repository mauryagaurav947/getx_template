import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

/// Global class to store data
/// and paginated products fetched from RestApi
/// and the type of data will be the parameter type of class
///
class Data<T> {
  final int statusCode;
  final String message;
  final T? data;

  bool get isSuccess => statusCode == HttpStatus.ok;

  const Data({
    this.message = 'Data not found',
    this.data,
    this.statusCode = 204,
  });

  /// Factory constructor to map json in to [Data] model
  factory Data.fromResponse(Response response) {
    return Data(
      statusCode: response.statusCode,
      message: response.reasonPhrase ?? 'Data retrieved',
    );
  }

  /// factory constructor to handles exceptions
  factory Data.fromException(Object exception) {
    if (exception is SocketException) {
      return Data(
        statusCode: exception.osError!.errorCode,
        message: exception.osError!.message,
      );
    } else if (exception is TimeoutException) {
      return Data(
        statusCode: HttpStatus.requestTimeout,
        message: exception.message!,
      );
    }
    return Data(
      statusCode: 000,
      message: exception.toString(),
    );
  }

  factory Data.error({String message = ''}) {
    return Data(message: message, statusCode: 500);
  }

  /// Method to map [Data] model into json
  Map<String, dynamic> toJson() {
    return {
      'status': statusCode,
      'message': message,
      'data': data,
    };
  }

  /// Copy with existing data
  Data<T> copyWith<T>({
    int? statusCode,
    String? message,
    T? data,
  }) =>
      Data<T>(
        data: data ?? (this.data as T?),
        message: message ?? this.message,
        statusCode: statusCode ?? this.statusCode,
      );
}
