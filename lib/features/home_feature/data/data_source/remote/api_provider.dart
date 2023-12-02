

import 'package:dio/dio.dart';
import 'package:test_second_flutter/features/home_feature/data/model/post_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  static const pageSize = 14;
  int offset = 0;

  Future<dynamic> fetchPosts() async {
    final response = await _dio.get('https://api.escuelajs.co/api/v1/products', queryParameters: {
      'limit': pageSize,
      'offset': offset,
    });

    offset += pageSize;

    return response;
  }
}