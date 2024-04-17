import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WebService {
  Dio privateDio = Dio();
  static WebService? _this;

  factory WebService(
    String baseUrl,
  ) {
    _this ??= WebService._(
      baseUrl: baseUrl,
    );
    return _this!;
  }

  WebService._({
    required String baseUrl,
  }) {
    privateDio.options.baseUrl = baseUrl;

    privateDio.options.connectTimeout = const Duration(milliseconds: 60000);
    privateDio.options.sendTimeout = const Duration(milliseconds: 60000);
    privateDio.options.receiveTimeout = const Duration(milliseconds: 60000);

    initializeClients();
    initializeInterceptors();
  }

  void initializeClients() async {}

  void initializeInterceptors() async {
    privateDio.interceptors.clear();

    privateDio.interceptors.add(InterceptorsWrapper(
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
        debugPrint(e.data.toString());
        debugPrint(e.statusCode.toString());
        return handler.next(e); // continue
      },
    ));
  }

  void cancelAllRequests() {
    _this?.privateDio.close(force: true);
  }
}
