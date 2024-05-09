import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Config/constants.dart';

class WebService {
  Dio privateDio = Dio();
  static WebService? _this;
  final String _baseURL = Constants.baseUrl;

  factory WebService() {
    _this ??= WebService._();
    return _this!;
  }

  WebService._() {
    privateDio.options.baseUrl = _baseURL;
    privateDio.options.connectTimeout = const Duration(milliseconds: 60000);
    privateDio.options.sendTimeout = const Duration(milliseconds: 60000);
    privateDio.options.receiveTimeout = const Duration(milliseconds: 60000);

    initializeClients();
    initializeInterceptors();
  }

  void initializeClients() async {}

  void initializeInterceptors() async {
    privateDio.interceptors.clear();

    privateDio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Content-Type'] = 'application/json';

          debugPrint('send request ${options.uri}');
          debugPrint('headers: ${options.headers}');
          debugPrint('query parameters: ${options.queryParameters}');
          debugPrint('data: ${options.data}');

          return handler.next(options);
        },
        onError: (e, handler) {
          debugPrint('path: ${e.requestOptions.path}');
          debugPrint('response: ${e.response}');
          debugPrint('statusCode: ${e.response?.statusCode}');
          debugPrint('data: ${e.response?.data}');
          debugPrint("error ${e.error}");
          debugPrint("message ${e.message}");
          debugPrint("type ${e.type}");
        },
        onResponse: (e, handler) {
          debugPrint('response: ${e.data.toString()}');
          debugPrint('statusCode: ${e.statusCode.toString()}');
          return handler.next(e); // continue
        },
      ),
    );
  }

  void cancelAllRequests() {
    _this?.privateDio.close(force: true);
  }
}
