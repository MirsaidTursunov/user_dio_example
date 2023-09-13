
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/core/server_error.dart';
import 'package:untitled/features/home/data/models/get_user_response.dart';

class HomeRepository {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final dio = Dio()
    ..options = BaseOptions(
      contentType: 'application/json',
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    )
    ..interceptors.addAll(
      [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
      ],
    );

  Future<GetUserResponse> getUsers() async {
    try {
      final response = await dio.get<dynamic>(
        'https://randomuser.me/api/?results=100',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetUserResponse.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw ServerException(message: 'Something went wrong!');
    }
  }
}
