import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';

/// Config Http Options
Future<void> httpConfig() async {
  await _httpClientConfig();
}

/// Config Http globally
///
/// Add "Authorization" in header to every request sent,
///
/// Add Log on console for see (Request/Response) details.
_httpClientConfig() {
  GetIt.I.registerSingleton<Dio>(
    Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (request, handler) async {
            var headers = {
              'Accept': 'application/json',
            };
            request.headers.addAll(headers);
            request.connectTimeout = 100000;
            request.receiveTimeout = 100000;
            handler.next(request);
          },
          onError: (error, handler) async {
            handler.next(error);
          },
          onResponse: (response, handler) {
            handler.next(response);
          },
        ),
      )
      ..interceptors.add(
        DioLoggingInterceptor(
          level: Level.body,
          compact: false,
          logPrint: (object) => log(object.toString(), name: "HTTP INTERCEPTOR"),
        ),
      ),
  );
}
