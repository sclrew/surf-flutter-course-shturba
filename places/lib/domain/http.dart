import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio(baseOptions);

BaseOptions baseOptions = BaseOptions(
  baseUrl: 'https://jsonplaceholder.typicode.com/',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  responseType: ResponseType.json,
);

Future<dynamic> dioGetPosts() async {
  initInteractors();
  final response = await dio.get<String>('/users');
  if (response.statusCode == 200) {
    return response.data ?? 'empty answer from dio.get';
  }
  throw Exception('HTTP error! Error code ${response.statusCode} ');
}

void initInteractors() {
  dio.interceptors.add(
    InterceptorsWrapper(
      onError: (err, handler) {
        // ignore: avoid_print
        print(err.toString());
        return handler.next(err);
      },
      onRequest: (requestOptions, handler) {
        // ignore: avoid_print
        print('Запрос отправляется');
        return handler.next(requestOptions);
      },
      onResponse: (response, handler) {
        // ignore: avoid_print
        print('Ответ получен');
        return handler.next(response);
      },
    ),
  );
}
