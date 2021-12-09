import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/Data/constants.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: newsBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    @required String? path,
    @required Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      path ?? newsMethodUrl,
      queryParameters: query,
    );
  }
}
