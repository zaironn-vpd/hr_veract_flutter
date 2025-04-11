import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hr_veract/src/features/auth/dio.dart';
import 'package:hr_veract/src/features/auth/domain/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:hr_veract/src/features/auth/domain/auth_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_impl.g.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<AuthUser> signIn(String userName, String password) async {
    try {
      final response = await _dio.post(
        '/user/login',
        data: json.encode({'userName': userName, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = response.data;

        final userName = data['user']['username'];
        final email = data['user']['email'];
        final token = data['authorisation']['token'];

        final fullUserMap = {
          'userName': userName,
          'email': email,
          'token': token,
        };

        return AuthUser.fromJson(fullUserMap);
      } else {
        throw Exception('Error logging in');
      }
    } on DioException catch (e) {
      throw Exception('Error makking API Request: ${e.message}');
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}

@riverpod
AuthRepositoryImpl authRepositoryImpl(Ref ref) {
  return AuthRepositoryImpl(dio: ref.watch(dioProvider));
}
