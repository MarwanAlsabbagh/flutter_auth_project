import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class ApiService extends GetxService {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: Duration(milliseconds: 10000),
      receiveTimeout: Duration(milliseconds: 10000),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  ApiService() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        print('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        print('Response: ${response.statusCode} ${response.data}');
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);
      return response;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> put(String path, {dynamic data}) async {
    try {
      final response = await dio.put(path, data: data);
      return response;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Response> delete(String path) async {
    try {
      final response = await dio.delete(path);
      return response;
    } catch (e) {
      throw handleError(e);
    }
  }

  dynamic handleError(dynamic error) {
    if (error is DioException) {
      switch (error.response?.statusCode) {
        case 400:
          throw Exception('Bad Request');
        case 401:
          throw Exception('Unauthorized');
        case 403:
          throw Exception('Forbidden');
        case 404:
          throw Exception('Not Found');
        case 500:
          throw Exception('Internal Server Error');
        default:
          throw Exception('Unexpected Error');
      }
    } else {
      throw Exception('Unexpected error occurred');
    }
  }
}
