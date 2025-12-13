import 'package:Ecommerce/core/api_layer/api_client/endpoints.dart';
import 'package:Ecommerce/core/keys/shared_key.dart';
import 'package:Ecommerce/core/modules/shared_preferences_module.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestBody: false,
      responseBody: false,
      requestHeader: false,
      responseHeader: false,
      compact: true,
    );
  }

  @singleton
  Dio provideDio(PrettyDioLogger logger, SharedPrefHelper sharedPrefHelper) {
    final dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        validateStatus: (status) => status != null && status < 500,
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = sharedPrefHelper.getString(
            key: SharedPrefKeys.tokenKey,
          );
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );

    // إضافة الـ Logger
    dio.interceptors.add(logger);

    return dio;
  }
}
